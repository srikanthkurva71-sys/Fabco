# FABCO Carrom Club

FABCO is an original browser-based carrom game with mandatory account sign-in.

## Play
https://srikanthkurva71-sys.github.io/Fabco/

## Game modes
- Practice vs Robot: local single-player practice against a basic computer opponent.
- Private online friend room: create an 8-character room code; one friend signs in and joins with that code. The board synchronizes through Supabase Realtime private Broadcast channels.
- No guest access: the app checks for a Supabase Auth session before opening a game. There is no guest/demo button.

## Sign-in
- Google OAuth (requires the provider to be configured in the Supabase dashboard).
- Email magic link (requires Supabase email sign-in to be enabled).
- The app uses the linked FABCO Supabase project and its public publishable key. No service-role or secret key is in the website.

## Controls
Drag the blue striker backwards from the direction you want to shoot, then release. Works with touch or mouse. Pocket your colour coins. Queen covering and scoring are simplified casual rules.

## Online setup and security
See CARROM_SETUP.md and database/carrom_online_rooms.sql. The linked Supabase project already has the carrom_rooms table, room RPCs, RLS and private Realtime policies applied. A project owner/guardian must confirm Auth providers and disable public Realtime channel access as described in the setup guide.

## Important limitations
Online rooms use authenticated private Realtime channels and room membership policies. This is a casual prototype, not a tournament-grade authoritative game server. Clients simulate physics and broadcast settled board snapshots; a modified client could cheat. Reconnect recovery, full tournament rules, moderation/reporting and comprehensive device testing remain unfinished. The robot is a basic local practice opponent.

FABCO is intended to remain free. Supabase and GitHub Pages free tiers have quotas and availability limits; do not enable billing or paid add-ons.
