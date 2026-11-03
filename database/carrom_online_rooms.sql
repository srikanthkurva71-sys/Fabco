-- FABCO Carrom Club private online room schema.
-- This SQL has already been applied to the linked FABCO Supabase project.
create table if not exists public.carrom_rooms (
 id uuid primary key default gen_random_uuid(),
 invite_code text not null unique,
 host_id uuid not null references auth.users(id) on delete cascade,
 guest_id uuid references auth.users(id) on delete set null,
 status text not null default 'waiting' check (status in ('waiting','playing','finished')),
 created_at timestamptz not null default now(),
 expires_at timestamptz not null default now() + interval '12 hours'
);
alter table public.carrom_rooms enable row level security;
revoke all on public.carrom_rooms from anon;
grant select on public.carrom_rooms to authenticated;
drop policy if exists "Players can read rooms they joined" on public.carrom_rooms;
create policy "Players can read rooms they joined" on public.carrom_rooms
for select to authenticated
using ((select auth.uid()) = host_id or (select auth.uid()) = guest_id);
create or replace function public.create_carrom_room()
returns table(room_id uuid, invite_code text)
language plpgsql security definer set search_path = ''
as $$
declare v_id uuid; v_code text;
begin
 if auth.uid() is null then raise exception 'Sign in required'; end if;
 loop
  v_code := upper(substr(md5(gen_random_uuid()::text),1,8));
  exit when not exists (select 1 from public.carrom_rooms r where r.invite_code=v_code);
 end loop;
 insert into public.carrom_rooms(invite_code,host_id) values(v_code,auth.uid()) returning id into v_id;
 return query select v_id,v_code;
end;
$$;
create or replace function public.join_carrom_room(p_invite_code text)
returns table(room_id uuid, host_id uuid, guest_id uuid, status text)
language plpgsql security definer set search_path = ''
as $$
declare v_room public.carrom_rooms%rowtype;
begin
 if auth.uid() is null then raise exception 'Sign in required'; end if;
 select * into v_room from public.carrom_rooms
 where invite_code=upper(trim(p_invite_code)) and status='waiting' and expires_at>now()
 for update;
 if not found then raise exception 'Room code not found or room is full'; end if;
 if v_room.host_id=auth.uid() then raise exception 'You cannot join your own room'; end if;
 update public.carrom_rooms set guest_id=auth.uid(),status='playing'
 where id=v_room.id and guest_id is null;
 return query select v_room.id,v_room.host_id,auth.uid(),'playing'::text;
end;
$$;
revoke all on function public.create_carrom_room() from public,anon;
revoke all on function public.join_carrom_room(text) from public,anon;
grant execute on function public.create_carrom_room() to authenticated;
grant execute on function public.join_carrom_room(text) to authenticated;
drop policy if exists "Carrom members can receive room broadcasts" on realtime.messages;
create policy "Carrom members can receive room broadcasts" on realtime.messages
for select to authenticated using (extension='broadcast' and exists (
 select 1 from public.carrom_rooms r where realtime.topic()='carrom:'||r.id::text
 and (r.host_id=(select auth.uid()) or r.guest_id=(select auth.uid()))
));
drop policy if exists "Carrom members can send room broadcasts" on realtime.messages;
create policy "Carrom members can send room broadcasts" on realtime.messages
for insert to authenticated with check (extension='broadcast' and exists (
 select 1 from public.carrom_rooms r where realtime.topic()='carrom:'||r.id::text
 and (r.host_id=(select auth.uid()) or r.guest_id=(select auth.uid()))
));

-- Covering indexes for room membership foreign keys.
create index if not exists carrom_rooms_host_id_idx on public.carrom_rooms(host_id);
create index if not exists carrom_rooms_guest_id_idx on public.carrom_rooms(guest_id);


-- Four-player room extension applied in migration carrom_four_player_rooms.
alter table public.carrom_rooms add column if not exists player_ids uuid[] not null default '{}';
update public.carrom_rooms set player_ids=array_remove(array[host_id,guest_id],null) where cardinality(player_ids)=0;
drop function if exists public.join_carrom_room(text);
create or replace function public.create_carrom_room()
returns table(room_id uuid, invite_code text)
language plpgsql security definer set search_path = ''
as $$
declare v_id uuid; v_code text;
begin
 if auth.uid() is null then raise exception 'Sign in required'; end if;
 loop
  v_code := upper(substr(md5(gen_random_uuid()::text),1,8));
  exit when not exists (select 1 from public.carrom_rooms r where r.invite_code=v_code);
 end loop;
 insert into public.carrom_rooms(invite_code,host_id,player_ids) values(v_code,auth.uid(),array[auth.uid()]) returning id into v_id;
 return query select v_id,v_code;
end;
$$;
create or replace function public.join_carrom_room(p_invite_code text)
returns table(room_id uuid, host_id uuid, player_id uuid, seat integer, player_count integer, status text)
language plpgsql security definer set search_path = ''
as $$
declare v_room public.carrom_rooms%rowtype; v_count integer; v_players uuid[];
begin
 if auth.uid() is null then raise exception 'Sign in required'; end if;
 select * into v_room from public.carrom_rooms where invite_code=upper(trim(p_invite_code)) and status in ('waiting','playing') and expires_at>now() for update;
 if not found then raise exception 'Room code not found or expired'; end if;
 v_players := coalesce(v_room.player_ids,array_remove(array[v_room.host_id,v_room.guest_id],null));
 if auth.uid()=any(v_players) then raise exception 'You are already in this room'; end if;
 v_count := cardinality(v_players);
 if v_count>=4 then raise exception 'Room is full (maximum 4 players)'; end if;
 v_players := array_append(v_players,auth.uid());
 update public.carrom_rooms set player_ids=v_players,guest_id=case when v_count=1 then auth.uid() else guest_id end,status='playing' where id=v_room.id;
 return query select v_room.id,v_room.host_id,auth.uid(),v_count+1,cardinality(v_players),'playing'::text;
end;
$$;
revoke all on function public.create_carrom_room() from public,anon;
revoke all on function public.join_carrom_room(text) from public,anon;
grant execute on function public.create_carrom_room() to authenticated;
grant execute on function public.join_carrom_room(text) to authenticated;
drop policy if exists "Players can read rooms they joined" on public.carrom_rooms;
create policy "Players can read rooms they joined" on public.carrom_rooms for select to authenticated using ((select auth.uid())=any(player_ids));
drop policy if exists "Carrom members can receive room broadcasts" on realtime.messages;
create policy "Carrom members can receive room broadcasts" on realtime.messages for select to authenticated using (extension='broadcast' and exists (select 1 from public.carrom_rooms r where realtime.topic()='carrom:'||r.id::text and (select auth.uid())=any(r.player_ids)));
drop policy if exists "Carrom members can send room broadcasts" on realtime.messages;
create policy "Carrom members can send room broadcasts" on realtime.messages for insert to authenticated with check (extension='broadcast' and exists (select 1 from public.carrom_rooms r where realtime.topic()='carrom:'||r.id::text and (select auth.uid())=any(r.player_ids)));
