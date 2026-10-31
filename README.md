# FABCO — Game Project

FABCO is an original, browser-first multiplayer survival arena game. It takes inspiration from the broad last-player-standing format, while using its own identity, maps, characters, progression and rules.

## Complete architecture

The full game blueprint is documented in [ARCHITECTURE.md](ARCHITECTURE.md). It defines Solo Survival, four-player Squad Survival, Training, Casual and Ranked modes; original home/township, forest, mountain, plains and valley environments; transport-only solo aircraft and squad helicopter arrival sequences; character skins, outfits, pets, FAB Coins, player statistics, percentage-based performance, ranks, friends, backend services, security and phased implementation gates.

FABCO uses a non-weapon survival design: no firearms or realistic weapon mechanics. Competitive play is based on movement, defensive abilities, environmental hazards and outplaying rivals. FAB Coins are planned as cosmetic-only currency.

## Product goals

- Play directly in the browser without redirecting to another game site.
- Install on supported devices as a Progressive Web App (PWA).
- Mobile-first touch controls and desktop keyboard controls.
- Original characters, arenas, cosmetics, coins, ranks, missions and friend invitations.
- Guest play plus account-based profiles and saved progress.
- Free-to-start infrastructure; no Firebase.

## Gameplay direction

FABCO will be a non-weapon competitive survival game. Players explore an arena, avoid environmental hazards, navigate a shrinking safe area, collect tokens, use defensive movement abilities and compete to be the last player remaining. The project will not include firearms or realistic weapon mechanics. All maps, characters, names, art and interface elements will be original.

## Planned game systems

1. **Arena:** original maps, obstacles, moving hazards, safe-zone progression and spawn balancing.
2. **Characters:** selectable original avatars, cosmetic outfits and visual customization.
3. **Movement:** walking, sprinting, jumping/dodging and collision handling.
4. **Pickups:** coins/tokens, temporary shields, speed boosts and defensive power-ups.
5. **Match flow:** lobby, matchmaking, countdown, match, results and rematch.
6. **Progression:** player level, seasonal rank, achievements, missions and cosmetic unlocks.
7. **Social:** friend requests, invite codes, party lobby and mute/report/block controls.
8. **Profiles:** display name, generated player ID, avatar and saved progress.

## Proposed technology

- **Client:** HTML, CSS, JavaScript and Phaser for the 2D browser game.
- **Static hosting:** GitHub Pages for the public game client and PWA files.
- **Accounts and data:** Supabase Auth + Postgres on the Free plan, subject to quotas and inactivity pausing.
- **Realtime prototype:** Supabase Realtime for small-scale lobby/presence experiments. Competitive multiplayer ultimately needs an authoritative game server; GitHub Pages cannot run that server.
- **Security:** server-side validation for ranks, coins, match results and friend actions. Never trust client-submitted scores or currency balances.

## Free-tier constraints

Free tiers have limits and can change. Supabase Free currently lists 50,000 monthly active users, 500 MB database, 5 GB egress, 2 million Realtime messages and 200 peak Realtime connections; free projects may pause after a week of inactivity. These are provider quotas, not a guarantee of unlimited players.

GitHub Pages is static hosting with published-site and bandwidth limits. It does not host the realtime game server. Do not put passwords, OAuth client secrets, service-role keys or private credentials in this public repository.

## Milestones

- [x] M1 — Product specification and visual direction
- [x] M2 — Responsive game portal and playable local arena prototype (initial build)
- [x] M3 — Basic movement, arena obstacles, energy pickups, shrinking safe zone and practice rivals (initial build)
- [ ] M4 — Supabase project setup and authentication configuration
- [ ] M5 — Profiles, friends, invites and persistence with database security policies
- [ ] M6 — Realtime lobby prototype
- [ ] M7 — Authoritative multiplayer server and match validation
- [ ] M8 — Ranking, missions, accessibility, performance and abuse testing
- [ ] M9 — PWA install flow and GitHub Pages publication

## Current status

Initial browser prototype committed in `index.html`. It includes a responsive FABCO landing screen, instructions, keyboard/touch movement, practice rivals, collectible energy, arena obstacles, a shrinking safe zone, local coin/level persistence and match results. This is a solo practice prototype, not online multiplayer. No authentication provider, Supabase project, friend system or multiplayer server is configured yet. These features must not be presented as live until implemented and tested.
