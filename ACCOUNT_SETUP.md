# FABCO Account Setup

## Live FABCO Supabase project (created 1 November 2026)

- Organization: `Fabco` (Free plan)
- Project: `FABCO`
- Project reference: `epnmctnjvpgkcaftrmne`
- Region: `ap-south-1` (South Asia)
- Project URL: `https://epnmctnjvpgkcaftrmne.supabase.co`
- Client key: the public `sb_publishable_` key is configured as the default in the FABCO website source. It is designed for browser use; it is not a secret.
- Database: `public.fabco_profiles` has been created, Row Level Security is enabled, and each authenticated player is restricted to their own profile row.
- Verification: the table exists, a read-only test query succeeded, and Supabase security/performance advisors returned no findings at setup time.

**Cost rule:** FABCO is configured on the Free plan. Do not enable paid add-ons, upgrade, or enter payment details. Supabase free quotas and inactivity/pause limits apply; free does not mean unlimited or guaranteed permanent uptime. If a feature asks for payment, stop and leave it disabled.

## Account choices implemented in the client

The Account / Sign In screen currently offers:
- Google sign-in
- Facebook sign-in
- Discord sign-in
- Email one-time sign-in link (passwordless)

Firebase is intentionally not used. The current implementation uses Supabase Auth and its free-plan tier, subject to the provider's current quotas and terms. Do not enter payment details or upgrade just to test this prototype.

## What can be backed up

After the Supabase project and profile table are configured, FABCO can back up and restore:
- Player display name and provider avatar (when the provider supplies one)
- Account level and XP
- Practice match statistics and achievements
- Current cosmetic character, outfit, companion and owned cosmetic inventory
- The current local prototype's coin balance as a personal cloud snapshot

Important: this is an early client-side backup, not a secure competitive economy. A player can modify browser data, so the saved coin balance, XP, statistics and rank must not be trusted for official leaderboards, ranked matchmaking, prizes or purchases. Those require the authoritative game server and server-verified match results. OAuth passwords are never collected or stored by FABCO; Google, Facebook and Discord handle their own sign-in.

## 1. Create the Supabase project

The FABCO project has already been created and its Project URL plus public publishable key are preconfigured in the website. No manual key entry is needed for the current deployment. If configuration ever needs to be changed, use only the Project URL and public publishable key. Never paste a service-role key, secret key, database password or OAuth client secret into FABCO or GitHub.

Firebase is not part of this setup.

## 2. Create the profile table

The `public.fabco_profiles` table and its Row Level Security policies have already been created in the live FABCO project. The matching SQL reference is in `supabase/fabco_profiles.sql`. Each signed-in player can read and change only the row whose user_id matches their authenticated account.

## 3. Configure sign-in providers

In Supabase Dashboard → Authentication → Sign In / Providers (labels can vary):

- Enable Google and enter the OAuth Client ID and Client Secret from your Google developer project.
- Enable Facebook and enter the App ID and App Secret from your Meta developer app.
- Enable Discord and enter the Client ID and Client Secret from your Discord developer application.
- Enable Email sign-in / OTP for passwordless email links.

For each OAuth provider, use the exact callback URL displayed by Supabase in that provider's setup instructions. Do not guess the callback URL. Add the deployed FABCO GitHub Pages address to Supabase Authentication URL Configuration as the Site URL and an allowed Redirect URL. The email provider must also allow the deployed FABCO URL.

Provider developer accounts and provider approval/configuration may be required. The sign-in code itself does not charge a FABCO fee, but provider policies and Supabase free-tier quotas apply. Supabase's built-in email sending is rate-limited; production email delivery may require a separately configured SMTP service. Do not pay for anything just to test this prototype.

## 4. Sign in

1. Open FABCO → ACCOUNT / SIGN IN.
2. Choose Google, Facebook or Discord; or enter an email and request a one-time link.
3. Complete the provider flow or open the email link on the same device/browser.
4. The account status should show Signed in.
5. Once the profile table and policies are ready, FABCO restores the cloud profile or creates the first backup.

## 5. Important limitations

- This is an initial account and profile-sync implementation. It has not yet been tested against a configured Supabase project or on multiple devices.
- OAuth provider setup (Google, Facebook, Discord) still requires the provider's own developer-console credentials and redirect configuration. Those credentials must be entered only in the Supabase dashboard by the project owner/guardian, never in this chat or GitHub. Email OTP availability and delivery are subject to Supabase's current free-tier settings and limits.
- The profile backup is a client-side snapshot. It is not authoritative for ranked results, rewards, wallet integrity, or anti-cheat.
- Friends, account deletion UI, account recovery support, data export, moderation, and server-authoritative progression are not implemented yet.
- Do not use a public room code as account authentication.
- Do not put personal secrets or passwords in player nicknames. Use only an account you are permitted to use and follow each provider's age and account rules.

## Privacy principle

FABCO should store only the data needed for a player profile and game progress. It must not store external-provider passwords. Before public release, add a clear privacy policy, data export/deletion workflow, retention rules, and a security review.
