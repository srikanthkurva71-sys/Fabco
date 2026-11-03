# FABCO — Last Zone

FABCO is an original, browser-based **2D survival arena prototype**. It uses an original visual identity and game equipment rather than copying another game's artwork or interface.

## Play

GitHub Pages: https://srikanthkurva71-sys.github.io/Fabco/

## Current playable prototype

- Entry screen with Google OAuth and email magic-link options (requires a configured Supabase project); local demo mode is available before account setup.
- Lobby, character collection, armory, inventory, profile and settings.
- Landscape-oriented 2D arena with keyboard and touch movement.
- One connected arena with a shrinking safe zone.
- Ground supply crates with fictional game equipment and utility pickups.
- Eight abstract equipment classes: Pulse Tagger, Burst Beacon, Scatter Spark, Precision Marker, Arc Launcher, Foam Tool, Shield Disc and First-aid Kit.
- Practice rivals with simple movement, proximity pressure and hit points; equipped tools can tag rivals.
- Match timer, health, alive count, match results and local progression.
- New accounts start **UNRANKED**. No automatic Bronze rank.
- Character unlocks require coins earned through completed matches.
- No energy collection, energy meter, real-money purchases or paid add-ons.

## Controls

- **W / A / S / D** or **arrow keys** — move.
- **E** or **PICK UP** — collect a nearby supply crate.
- **Space** or **USE TOOL** — use the currently equipped fictional game tool.
- **P** or the pause button — pause.

On phones, rotate to landscape for the intended gameplay layout and use the on-screen movement/action buttons.

## Account setup

See [SUPABASE_SETUP.md](SUPABASE_SETUP.md) for free-tier Supabase Auth setup, Google/email provider configuration, redirect URLs and security guidance.

Important:
- Only the Supabase project URL and public anon/publishable key belong in the browser.
- Never publish a service-role key, secret key, OAuth client secret or database password.
- Local demo progress is stored in the browser and can be edited or cleared. It is not trusted competitive data.

## Current limitations — not yet production multiplayer

This is a local 2D practice prototype, not a finished 3D battle royale game. It does not yet provide:
- A trusted authoritative multiplayer game server or real matchmaking.
- Shared online match state, squads, friends or reconnect handling.
- Server-validated eliminations, results, coins, inventory or ranks.
- Cloud-saved player progression, anti-cheat, moderation or reporting.
- Full animation, audio, complete map art, vehicles or production-ready mobile optimization.
- Verified production OAuth configuration; Google and email sign-in need the owner's Supabase project setup and end-to-end testing.

Do not advertise ranked online multiplayer or production security until these systems have been implemented and independently tested.

## Free-tier policy

FABCO's development plan is to use free services only. Do not enable billing, paid add-ons, paid infrastructure or subscriptions. Provider free-tier quotas and inactivity rules still apply; free hosting is not unlimited capacity.

## Development checks

GitHub Actions runs `node scripts/validate-html.cjs` on pushes and pull requests. A passing syntax/ID check does not replace browser, mobile, authentication, security or multiplayer testing.
