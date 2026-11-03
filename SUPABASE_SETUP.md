# FABCO — Supabase account setup

This guide configures sign-in only. FABCO's current match progress, earned coins, inventory and character unlocks are stored locally in the browser. They are not yet trusted cloud-ranked records.

## 1. Keep the project on the free tier

- Use the existing Supabase project and its free-tier limits.
- Do not enable billing, paid add-ons, paid compute, or a paid plan for this prototype.
- If the dashboard asks for payment or an upgrade, stop; this guide does not require it.

## 2. Configure the browser app

1. Open FABCO and choose **Explore local demo**.
2. Open **Settings**.
3. Enter the Supabase Project URL and the public **anon** key (or publishable key).
4. Save the configuration.
5. Never enter a service-role key, secret API key, database password, or OAuth client secret in FABCO or GitHub.

The browser key is public by design. It is safe to expose only when database access is protected with Row Level Security (RLS).

## 3. Enable Google sign-in

Google sign-in requires a Google OAuth client and a guardian-managed Google Cloud project because the player is under 18.

1. In Supabase Dashboard, open **Authentication → Providers → Google**.
2. Follow Supabase's current Google provider instructions to create and configure the OAuth client.
3. Add the client ID and client secret only in the Supabase dashboard. Never put the secret in the website.
4. Enable Google provider.
5. In **Authentication → URL Configuration**, add the exact deployed FABCO URL to allowed redirect URLs:
   `https://srikanthkurva71-sys.github.io/Fabco/`
6. Save and test using a Google account with guardian approval.

Google may require a verified OAuth consent configuration before sign-in works for general users.

## 4. Enable email magic links

1. In **Authentication → Providers → Email**, enable email sign-in.
2. Review the email template and ensure the magic-link URL redirects back to the deployed FABCO URL.
3. In **Authentication → URL Configuration**, allow the same deployed URL shown above.
4. Save. The player enters an email address in FABCO and receives a one-time sign-in link.

Do not disable email security protections or broaden redirect URLs to arbitrary domains.

## 5. Optional private profile table

The current prototype does not need a database table to play. If you later want cloud-saved display names, run this SQL in the Supabase SQL Editor. It stores only the authenticated user's own profile label. It deliberately does not let the browser write ranked results, coins, match placements, or rewards.

```sql
create table if not exists public.player_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Survivor'
    check (char_length(display_name) between 1 and 24),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.player_profiles enable row level security;

revoke all on table public.player_profiles from anon;
grant select, insert, update on table public.player_profiles to authenticated;

create policy "Players can read their own profile"
on public.player_profiles for select
to authenticated
using ((select auth.uid()) = user_id);

create policy "Players can create their own profile"
on public.player_profiles for insert
to authenticated
with check ((select auth.uid()) = user_id);

create policy "Players can update their own profile"
on public.player_profiles for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);
```

Run this SQL only once. If the table already exists, inspect it and its policies first rather than blindly repeating policy creation.

## 6. Current online-game limitation

Authentication is not the same as multiplayer. The current prototype does not yet have a trusted authoritative match server, matchmaking, server-validated hit detection, shared match results, cloud inventory, anti-cheat, moderation, or reconnect recovery. Do not advertise ranked multiplayer as available until those systems exist and are tested.

## Privacy and security

- Do not collect unnecessary personal information.
- Never store passwords in FABCO.
- Never expose secret or service-role keys.
- Use RLS for every exposed table.
- A browser/local-storage save can be edited or cleared by the player; it is not proof of a legitimate ranked result.
- Have a parent or guardian review provider setup, privacy disclosures, and account requirements before publishing to other players.
