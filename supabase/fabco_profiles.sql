-- FABCO account profile storage (Supabase SQL Editor)
-- Run this once in your own FABCO Supabase project.
-- This table stores a player's private cloud backup. It is not a trusted
-- source for competitive rankings, official rewards, or anti-cheat decisions.

create table if not exists public.fabco_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Player'
    check (char_length(display_name) between 1 and 24),
  avatar_url text,
  profile_data jsonb not null default '{}'::jsonb,
  inventory_data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.fabco_profiles enable row level security;

drop policy if exists "Players can read their own FABCO profile" on public.fabco_profiles;
create policy "Players can read their own FABCO profile"
  on public.fabco_profiles for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Players can create their own FABCO profile" on public.fabco_profiles;
create policy "Players can create their own FABCO profile"
  on public.fabco_profiles for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Players can update their own FABCO profile" on public.fabco_profiles;
create policy "Players can update their own FABCO profile"
  on public.fabco_profiles for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

grant select, insert, update on public.fabco_profiles to authenticated;
