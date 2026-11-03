# FABCO Carrom Club — account and online-room setup

## Already configured
The existing FABCO Supabase project has the carrom_rooms table, RLS, room creation/join RPC functions and private Realtime Broadcast policies applied. The SQL is recorded in database/carrom_online_rooms.sql.

## Required dashboard checks
A project owner or parent/guardian should review these settings before inviting other players:

1. Supabase Dashboard → Authentication → Providers: enable Email sign-in (magic links). Configure Google OAuth only if Google sign-in is wanted. Google needs a separately configured OAuth client.
2. Authentication → URL Configuration: add this exact allowed redirect URL: https://srikanthkurva71-sys.github.io/Fabco/
3. Realtime settings: turn Allow public access off so private-channel access policies are enforced.
4. Do not enable billing, paid add-ons or a paid plan. Stop if the dashboard asks for payment.

Never put an OAuth client secret, service-role key, secret API key or database password in GitHub or the browser.

## How friends play
1. Both players open the FABCO website and sign in.
2. Player A selects Create friend room and shares the displayed 8-character room code privately.
3. Player B enters that code and selects Join room.
4. The signed-in room members receive board snapshots over the room's private Realtime channel.

Rooms expire after 12 hours. Each room supports one host and one guest.

## Security and limitations
- No guest game access is provided.
- Room creation/join functions require auth.uid() and are granted only to authenticated users. They use SECURITY DEFINER with an empty search_path because they perform narrowly scoped room operations; the security advisor warning for these functions is intentional and should be reviewed during future audits.
- Board physics run in each browser and settled board states are broadcast to the other player. This is not an authoritative anti-cheat server. Do not use for ranked play, prizes or payments.
- Email magic-link delivery and Google OAuth depend on provider settings. Test with two separate approved accounts before sharing.
- Keep the project on free tiers only. Free tiers have quotas and are not unlimited.
