# FABCO — Complete Game Architecture Blueprint

Version 1.0 | Architecture baseline | Mobile-first web client | No Firebase

## 1. Product vision

FABCO is an original competitive survival-arena game focused on player skill, movement, map knowledge, teamwork, fair progression and customization. It takes inspiration from the broad Battle Royale genre but must have its own maps, characters, art, interface, progression and rules. Do not copy another game's protected assets or designs.

Core pillars:
1. Skill-first competition: positioning, movement, timing and teamwork.
2. Fair play: purchases never grant competitive power.
3. Mobile-first controls with desktop support.
4. Solo and four-player squad experiences.
5. Long-term progression through levels, ranks, missions and cosmetics.
6. Training mode for learning mechanics safely.

## 2. Gameplay safety and identity

FABCO will not implement firearms, realistic weapon mechanics, weapon acquisition or real-world tactical instruction. Competition uses fictional non-weapon mechanics: movement, dodge skills, temporary shields, energy fields, arena puzzles, environmental hazards, rescue/revive and non-graphic tag/energy outplay rules. Use terms such as Outplays, Arena Outs and Rival Eliminations in statistics rather than real-world kill framing.

## 3. Game modes

### Solo Survival
One player enters an arena after a transport arrival sequence. Choose a landing region, collect energy tokens and temporary defensive boosts, avoid the moving hazard boundary and outplay rivals. The last active player wins. Record placement, survival time, energy collected, objectives and outplays.

### Squad Survival
Squad size is four. A party leader creates a squad and invites friends using an expiring invite code/link. The four-player squad arrives in a shared transport helicopter. The helicopter is transport-only and has no attack functionality. Teammates can regroup, share selected support items, assist/revive and complete team objectives. Out players may spectate teammates until the result is final.

### Training Ground
No ranked score loss. Include movement courses, dash timing, obstacle routes, safe-zone practice, map exploration and adjustable computer-controlled rivals. Training results are separate from ranked statistics.

### Casual / Unranked
Low-pressure matches with no ranked-point loss. Casual results may update lifetime statistics but do not determine competitive rank.

### Ranked Survival
Skill-based matchmaking using server-authoritative ratings. Track solo and squad ratings separately. Rank changes depend on placement, lobby strength, verified performance and team contribution. Anti-cheat validation is mandatory before ranked launch.

## 4. One connected open world

FABCO has **one continuous shared world**, not separate selectable maps or isolated biome queues. Every match takes place in the same connected world. Players travel between districts without loading into a different map.

The connected world contains:
1. Residential township: houses, apartment blocks, courtyards, small shops and streets.
2. Factory and industrial district: factory buildings, warehouses, service yards and safe routes.
3. Campus district: educational buildings, playgrounds, courtyards and connecting paths.
4. Green belt: forest, gardens, parkland, streams and trails.
5. Highlands and valley: slopes, rocky paths, bridges and low-lying routes.
6. Open fields and outskirts: grassland, farms, scattered buildings and broad travel corridors.
7. Central town: public square, shops and roads linking the other districts.

These are regions inside one world, not separate maps. They must connect through a coherent road/path network with sensible transitions, recognizable landmarks and navigation cues. Future expansion adds districts to this same world.

The world definition includes district boundaries, roads and paths, building footprints, collision geometry, spawn regions, landmarks, traversal routes, environmental events, safe-zone phases, collectible spawn groups, lighting and accessibility settings.

World fairness rules:
- Balance spawn points and arrival routes across all districts.
- Avoid unavoidable immediate spawn disadvantages.
- Telegraph hazards clearly and provide reaction time.
- Let the safe zone move across districts without making a whole district permanently unusable.
- Give buildings readable entrances, exits and navigation.
- Playtest travel times, route choices and visibility before ranked release.

## 5. Arrival and transport

### Solo arrival
A single-player transport aircraft brings the player into the same connected world. The player chooses a landing region or suggested landing point within that world. The aircraft is a non-combat transport only. The sequence is short and skippable.

### Squad arrival
One transport helicopter carries the four-player squad into the same connected world. The leader can suggest a landing district; members can confirm or choose nearby safe landing points. The helicopter is cinematic transport only, never a combat vehicle. Keep the sequence short and skippable.

## 6. Characters, skins, clothing and pets

### Characters
Create an original roster with unique names, biographies and readable silhouettes. Character selection happens in the lobby. Base models are cosmetic and confer no hidden competitive advantage.

### Cosmetic slots
- Character skins and full outfits.
- Tops, jackets, trousers and footwear.
- Headwear, masks and glasses as visual cosmetics.
- Backpacks and accessories.
- Emotes, victory poses and lobby animations.
- Arrival trails and glider cosmetics.
- Profile frames, banners and nameplates.

### Pets / companions
Pets are cosmetic companions in the lobby and optionally in matches. They must not reveal opponents, collect items automatically, block movement or grant competitive advantages. Players can hide pets and reduce visual effects.

### Skin selection and preview
Provide a rotatable/zoomable character preview, outfit-slot preview, complete-look preview, owned/equipped/locked/featured states, clear prices and a confirmation step. Prevent accidental purchases.

## 7. FAB Coins and cosmetic store

FAB Coins are virtual cosmetic currency.

Earn coins from verified match participation/results, missions, achievements, progression milestones and seasonal free rewards.

Store rules:
- Coins buy cosmetics only.
- No paid stat boosts, stronger abilities, better spawn positions or ranked advantages.
- Show item name, preview, rarity, price and ownership state.
- Require purchase confirmation.
- Verify wallet balance and purchases on the server.
- Keep an auditable transaction history.
- Never trust a coin balance supplied by the browser client.

Initial release should use earnable FAB Coins only. Any future real-money payment system requires separate review of platform rules, age/parental requirements, consumer protections and secure payment handling; it is outside the initial build.

## 8. Profiles and player statistics

Profile fields: unique public player ID, display name, avatar, selected character/loadout, account level, season rank, solo/squad summaries, achievements, recent match history, privacy and social settings.

Verified match statistics:
- Matches played, wins and top placements.
- Average placement and survival time.
- Outplays / rival eliminations.
- Energy collected and objectives completed.
- Assists, revives and teammate support.
- Squad wins and squad placement.
- Training course records.

### Performance percentages
Show several explainable percentages:
- Win rate = wins / completed matches × 100.
- Top-placement rate = matches in defined top placements / completed matches × 100.
- Objective completion = completed objectives / accepted objectives × 100.
- Team contribution = normalized score from verified assists, revives, support and shared objectives.
- Survival index = normalized survival time relative to match length and lobby conditions.

A combined FABCO Performance Index may be a weighted 0–100 summary, but publish its formula and show the underlying statistics too. Initial testing weights could be placement 35%, survival 25%, objectives 20%, team contribution 20%; playtesting must validate or change these weights before ranked release. Training does not affect ranked rating.

## 9. Ranks, skill rating, inactivity and account levels

### 9.1 Exact competitive rank ladder

Use this rank order, from entry tier to highest tier:

1. Bronze
2. Bronze II
3. Bronze III
4. Silver I
5. Silver II
6. Gold I
7. Diamond I
8. Diamond II
9. Diamond III
10. Master I
11. Master II
12. Grand Master I
13. Elite I
14. Elite II
15. Elite III
16. **FABCO Pro Elite Gamer** — highest prestige rank

The rank name shown on a profile must match the player's current division. Solo and Squad ratings should be tracked separately, so a player's solo rank does not automatically determine their squad rank.

### 9.2 How rank is earned

Rank is based on demonstrated skill and verified competitive performance, not simply the number of matches played or a single lucky win. The server calculates a hidden rating from multiple match signals:

- Match placement and wins.
- Opponent/lobby strength.
- Survival and safe-zone decision-making.
- Objectives completed.
- Team contribution in squad matches, including assists and revives.
- Consistency across a meaningful number of ranked matches.
- Verified fair-play and match completion status.

Wins should carry substantial weight, but a player who wins against stronger competition should earn more rating than one farming weak lobbies. Leaving matches early, exploiting bugs or suspicious performance must not produce rating rewards. Training and casual matches do not change competitive rank.

Each division has a rating range and promotion threshold. Exact rating numbers and promotion/relegation thresholds will be tuned using playtest data before ranked launch; they should not be guessed now.

### 9.3 Inactivity rank decay

The competitive rank can decrease after extended inactivity, but the player's account level and lifetime achievements never decrease because of inactivity.

Proposed rule for initial testing:
- First 14 consecutive days without completing a ranked match: no inactivity penalty.
- After the grace period: inactivity decay applies once per completed 7-day inactive period.
- Decay removes a limited number of ranked rating points; it must never directly erase account levels, coins already earned, cosmetics or lifetime statistics.
- Decay cannot push a player below the floor of their current major tier in a single weekly update. Any tier demotion happens only through normal rating thresholds and must be clearly shown.
- A completed ranked match pauses inactivity decay and resumes normal rating updates.
- Show a clear warning in the lobby/profile before decay begins and when it is applied.

The exact grace period and decay amount are configurable season settings. Test the rule with players before release. Avoid aggressive decay that punishes school, illness, holidays, connectivity problems or other legitimate breaks. Do not apply decay during a declared season break or server outage.

### 9.4 Account level and battle record

Account level is permanent progression and is separate from competitive rank:
- Level increases from verified match XP, completed missions and milestones.
- A win grants a meaningful XP bonus; placement, participation and objective/team contribution can also grant XP.
- A loss or inactivity never reduces account level.
- Training XP, if offered, must be capped and clearly separated from ranked rating so it cannot be exploited.

Always show the player's battle record:
- Battles played.
- Battles won.
- Win rate = wins / completed battles × 100.
- Top-placement count and rate.
- Solo and squad records separately.
- Current rank and current rating progress.
- Current account level and XP remaining to the next level.

Do not describe level as a count of wins alone. The profile should show both total battles and wins, while account XP rewards a broader range of verified play. This makes the player's experience transparent without encouraging repetitive match farming.

### 9.5 Rank integrity

Rank updates are calculated and stored server-side after match validation. The client can display rank data but cannot submit or edit rating points. Track rating history, season, mode, decay events and reason codes for support and audit.

## 10. Lobby, friends and social

- Guest play for the local prototype.
- Account sign-in when backend is configured.
- Generated player ID and display name.
- Friend search by exact player ID.
- Friend requests with accept/decline.
- Four-person squad party, leader/member roles and ready state.
- Invite codes/links with expiry.
- Mode/map selection and party ready check.
- Block, mute and report controls.
- Privacy settings for invitations and profile visibility.

Disable open text chat initially or use predefined quick messages/emotes until moderation and reporting are ready.

## 11. Match flow

1. Launch FABCO.
2. Guest profile or sign-in.
3. Home lobby.
4. Select character, outfit, pet and cosmetics.
5. Choose Training, Casual or Ranked.
6. Choose Solo or Squad where available.
7. Party ready check and matchmaking.
8. Map and arrival sequence.
9. Landing and match countdown.
10. Travel between districts, collect energy, complete objectives and respond to safe-zone phases.
11. Match completion and results.
12. Server validates result.
13. Rewards, statistics and rank update.
14. Return to lobby or rematch.

## 12. Client and backend architecture

### Browser client
HTML/CSS/JavaScript application shell; Phaser or comparable web game engine for rendering and input; responsive HUD; compressed/lazy-loaded assets; local storage only for non-sensitive settings and offline prototype progress. Never embed secrets or privileged keys in client code.

### Services
- GitHub Pages: static website and web assets only.
- Supabase Auth: candidate for email/social sign-in after project setup.
- Supabase Postgres: profiles, cosmetics, ownership, friends and match summaries.
- Supabase Realtime: lobby presence and small-scale prototype experiments.
- Authoritative game server: required for competitive matches, movement validation, match state, rewards and rank integrity.
- Asset storage/CDN: public versioned art and audio assets.

GitHub Pages cannot run the realtime match server. Free backend plans have quotas and may pause inactive projects. Online launch requires a separately deployed server and capacity testing.

### Backend service boundaries
Identity; profile; social/friends; cosmetic catalog; wallet ledger; matchmaking; authoritative match server; statistics; ranking/season; moderation/reporting.

## 13. Initial data model

- profiles: user ID, public player ID, display name, avatar, created date.
- player_settings: controls, accessibility, privacy and audio.
- characters: character catalog.
- cosmetics: skins, clothing, pets, emotes and rarity.
- player_inventory: owned cosmetic items.
- player_loadouts: equipped character and cosmetic slots.
- wallets: current FAB Coin balance derived from ledger.
- coin_ledger: append-only earning/spending transactions.
- friendships: requester, recipient, status and timestamps.
- blocks: blocker and blocked player.
- parties: leader, mode, invite code and expiry.
- party_members: membership and ready status.
- matches: match ID, mode, map, start/end and validation status.
- match_players: participant, placement and verified performance.
- player_statistics: derived lifetime and season aggregates.
- rank_seasons and player_ranks: season configuration and per-mode rating.
- missions and mission_progress: objectives and completion.
- reports: category, target and review state.

All user-owned rows require row-level security. Wallet, inventory, match result and rank writes must be performed by trusted server functions, never arbitrary browser requests.

## 14. Security and fair play

Validate match results on the server. Never accept client-submitted coins, ranks, wins or outplays as authoritative. Use short-lived sessions, database row-level security and least privilege. Keep service-role keys and OAuth secrets out of GitHub. Rate-limit login, invites, friend requests and reports. Add server-side movement/timing checks. Log wallet ledger changes and administrative actions. Provide block/report/privacy controls. Test duplicate rewards, replayed requests, disconnect abuse and manipulated client state.

## 15. Performance and accessibility

Target smooth performance on mid-range Android devices. Begin with lightweight 2D maps. Offer low/medium/high effects settings, reduced particles and pet visuals, scalable readable UI, high-contrast team indicators, left/right-handed touch layouts, control-size and sensitivity options. Compress assets and measure loading time, frame rate, memory and network usage on real devices.

## 16. Development phases and release gates

### Phase A — Local playable prototype
Responsive home/lobby/HUD; training arena; movement, dash, obstacles, energy pickups, safe-zone progression, computer rivals and local test progression.
Gate: stable browser play on target phone and desktop.

### Phase B — Content and customization
One connected open-world district framework; character catalog and skin preview; outfit slots and pet cosmetics; FAB Coin mock wallet and cosmetic shop; profile and statistics screens.
Gate: inventory/equip flow tested; no pay-to-win effects.

### Phase C — Accounts and social
Create Supabase project; configure auth providers; secure profile persistence; friends, invites and four-player party; database security policies.
Gate: account, privacy and data-security tests pass.

### Phase D — Online multiplayer
Authoritative server; matchmaking/lobby; solo and four-player squad sessions; transport arrival sequences; validated match results and reconnect handling.
Gate: load, latency, cheating and disconnect tests pass.

### Phase E — Ranked and release readiness
Rating system, ranks, leaderboards, missions, achievements, moderation, accessibility, performance audit, PWA install and public release checks.
Gate: no critical security issues; fair-play and device tests complete.

## 17. Current implementation status

The repository currently contains a playable single-player 2D browser prototype in index.html. It is not a complete online game or a production-scale open world.

Implemented in the browser prototype: FABCO home/lobby and instructions; keyboard and mobile touch movement; dash; practice rivals; energy pickups and a shrinking safe zone; local coin/level progression and match results; profile/statistics/rank display using local data; character, outfit and companion selection with local cosmetic inventory; a continuous camera-follow connected world with named districts, roads, buildings, basic collision, minimap, distinctive landmarks, hills, river and bridges, vegetation, street furniture, transport scenery and interactive building activities. The local match also includes collectible energy fragments, fantasy crystal puzzle panels activated through a player interaction, three restorable signal beacons, a sequential four-checkpoint road route, pause/resume/restart controls (including P/Escape keyboard shortcuts), and a match-results objective summary. The local profile also tracks eight milestone achievements, unlocks them from completed match statistics and mission completions, and stores their state in browser local storage. The home screen also includes a local accessibility settings screen with high-contrast interface, reduced CSS motion, and larger mobile touch controls; preferences persist in browser local storage and can be reset. The Explorer objective tracks fragments and location visits; the Signal Network objective tracks all three beacons; the route objective tracks four gates along the continuous road network. Mission state resets at the start of each local match.

Connected-world limitations: this remains a 2D browser prototype with a fixed-size illustrated world, not a large 3D open world. Buildings are exterior obstacles rather than enterable interiors. Transport is decorative scenery, not drivable vehicles. Practice rivals use simple movement and obstacle avoidance, not advanced pathfinding or online opponents. Exploration objectives and rewards are local match state, not cloud-saved achievements or server-verified rewards.

Not implemented yet: 3D character models; large-scale 3D world and enterable interiors; aircraft/helicopter arrival sequences; four-player parties and friend invitations; real accounts/cloud profiles; online multiplayer; authoritative match server; server-verified rewards and ranks; ranked matchmaking; persistent mission/achievement services and global leaderboards.

Architecture completion means the system design is defined; it does not mean every feature is already coded or operational. The GitHub Pages build is a client-side prototype only. Production online play requires a separately deployed authoritative backend, account system, database policies, moderation/reporting workflows, load testing and security review.


## Online multiplayer prototype — implementation status (2026-10-31)

The browser client now includes a first real-time squad-room prototype using Supabase Realtime:
- Squad Survival can be selected in the lobby.
- Players enter the same 4–10 character room code and connect to the same Supabase project.
- Supabase Presence announces connected players; Broadcast relays player coordinates and cosmetic color approximately 10 times per second.
- Other connected players are drawn in the shared world and on the minimap, with their chosen nickname.
- Squad match entry is blocked until the room connection is subscribed.
- The Supabase project URL, public client key, and nickname are stored in browser local storage on that device.
- The browser dynamically loads the Supabase JavaScript v2 client from jsDelivr when the player connects.

### Required setup before two people can connect
1. Create a Supabase project.
2. In the Supabase project, copy the Project URL and the public client key (publishable key, or legacy anon key if that is what the project currently provides).
3. In FABCO, open Settings → Online Multiplayer Connection. Paste the Project URL and public client key, choose a nickname, and save.
4. Both players must configure the same Supabase project, enter the same room code, and press Connect to Room.
5. After the status says Connected, select Squad Survival and enter the arena.

Realtime Broadcast and Presence are used on a public channel. Anyone who knows a room code and has the same public project configuration may be able to join that room. Do not treat room codes as private authentication. Never put a Supabase service-role key, secret key, database password, or other server secret in the browser.

### Important engineering limitations
This is a networked visual-play prototype, not yet production multiplayer:
- Player movement is client-reported and not validated by an authoritative game server; a modified client could send false positions.
- Match outcomes, scoring, missions, coin balances, achievements, and rankings are still calculated locally and are not shared or server-verified.
- Each client still runs its own practice rivals and match simulation; only connected human-player positions/presence are synchronized.
- There is no account system, invite system, matchmaking queue, server-side room capacity enforcement, reconnect recovery workflow, moderation, or anti-cheat service yet.
- A room code is a shared channel name, not a password. Do not put personal information in nicknames or room codes.
- Internet connection and a correctly configured Supabase project are required. The repository's static GitHub Pages hosting alone does not provide a multiplayer server.

The next production step is a trusted authoritative match service that validates movement, interactions, match state, scoring, player limits, and results. The current Broadcast prototype is suitable only for early friend-room experiments after configuration and testing.


---

# Engineering Architecture Specification — Baseline 1.1

This specification converts the product blueprint into implementable system contracts. It freezes the architectural direction while leaving measured balance values and provider-specific deployment settings configurable. Planned systems are not represented as already implemented.

## 18. Architecture decisions and scope boundaries

### 18.1 Platform and technology decisions
- Primary launch client: responsive browser game, with PWA installation where hosting headers and browser support permit.
- Primary input: Android touch; secondary input: desktop keyboard and mouse.
- Initial rendering: lightweight 2D top-down world. A 3D rewrite is a separate future phase, not a requirement hidden inside the first release.
- Static distribution: GitHub Pages can host the prototype and static assets. Production should use a controlled domain, HTTPS, versioned assets and a deployment pipeline.
- Simulation: fixed-step game simulation with rendering decoupled from simulation timing.
- Client: modular JavaScript ES modules for production. The current single-file prototype may remain temporarily; new systems should be separated by responsibility.
- Backend: Supabase may provide identity, relational persistence and social/lobby data. A dedicated authoritative game service owns live competitive match state.
- No privileged backend credential may be shipped to a browser.

### 18.2 First-MVP non-goals
The first MVP does not promise a 3D world, enterable building interiors, a large global matchmaking population, voice chat, user-generated maps, real-money purchases, esports-grade anti-cheat, console support or a large-scale persistent world. These require separate engineering, moderation, legal and operational work.

### 18.3 Requirement labels
MUST means release-blocking; SHOULD means expected unless a documented technical reason prevents it; MAY means optional. A feature is not complete merely because a screen or button exists: its acceptance test must pass.

## 19. Runtime component architecture

### 19.1 Client modules
1. App Shell: boot, screen routing, loading, error handling and version display.
2. Input Manager: touch, keyboard, focus, remapping and input normalization.
3. Renderer: camera, world layers, sprites, effects, HUD and minimap.
4. World Model: district metadata, roads, landmarks, collision shapes and spawn regions.
5. Simulation: movement, dash cooldown, collision, pickups, objectives, hazard phases and local practice rivals.
6. Match Coordinator: lifecycle, countdown, active state, pause policy, completion and results presentation.
7. Network Adapter: connection lifecycle, room subscription, presence, snapshot interpolation and reconnect.
8. UI: lobby, profile, settings, inventory, store, party, match HUD and results.
9. Local Persistence: non-sensitive preferences and explicitly offline-only progress.
10. Telemetry Adapter: consent-aware diagnostics with personal data minimized.
11. Audio Manager: sound effects, music, mute and volume.
12. Asset Manager: versioned loading, caching, fallbacks and integrity metadata.

UI code must not directly mutate authoritative match state. Modules communicate through documented events or narrow interfaces.

### 19.2 Backend services
Identity; profile; social/friends; cosmetic catalog; wallet ledger; matchmaking; authoritative match server; statistics; ranking/season; moderation/reporting; and operations/monitoring. These may initially be deployed together as a modular backend, but their responsibilities remain separate.

## 20. Simulation and connected-world contracts

### 20.1 Coordinate system
Use one world-space coordinate system with origin at top-left; positive X points east/right and positive Y south/down. Camera coordinates are presentation-only. Gameplay positions remain in world coordinates. World dimensions and district boundaries are versioned data, not scattered constants. The current 1800 × 1120 dimensions are prototype values, not a final size commitment.

### 20.2 World data
Each district has a stable ID, display name, bounds or polygon, navigation metadata, landmark IDs, ambient theme, spawn eligibility and accessibility notes. Roads and trails form a graph connecting navigation nodes. Buildings and solid scenery expose collision geometry separately from visual art.

The connected-world invariant is mandatory: districts are adjacent regions of one continuous world, not unrelated selectable maps. Future expansion extends the same world coordinate/navigation model or uses documented seamless partitioning that preserves continuous travel.

### 20.3 Movement contract
- Normalize directional input so diagonal movement is not faster than cardinal movement.
- Apply movement using elapsed simulation time, not frame count.
- Resolve collision before committing final position.
- Dash has server-defined duration, cooldown and movement envelope.
- The server rejects impossible speed, teleport distance, invalid cooldown use and out-of-bounds positions.
- Client prediction may improve responsiveness; server reconciliation corrects divergence.
- Cosmetics never change collision radius, speed, visibility or competitive capability.

### 20.4 Match state machine
The authoritative lifecycle is:
CREATED → WAITING_FOR_PLAYERS → READY_CHECK → COUNTDOWN → ACTIVE → RESULTS_PENDING → COMPLETED.

WAITING_FOR_PLAYERS or READY_CHECK may become CANCELLED on timeout or insufficient players. ACTIVE may enter PAUSED_FOR_RECOVERY only under a defined server policy, then resume or end safely. RESULTS_PENDING becomes DISPUTED if validation fails; unverified competitive rewards must not be issued. Every transition records timestamp, actor/service and reason code.

### 20.5 Objective state
Every objective has a stable ID, type, activation radius, prerequisites, individual/team ownership, completion state, reward definition and server validation rule. The server is authoritative for completion and rewards. Clients may predict visual feedback but cannot grant rewards.

### 20.6 Safe-zone state
Each hazard phase is a server-authored record containing phase number, warning start, movement start, end time, safe-region geometry and penalty policy. Warnings must be visible and accessible, allow response time and avoid unavoidable spawn traps. Timing and penalty values are balance configuration, not architectural constants.

## 21. Multiplayer protocol and authority

### 21.1 Transport
Production live matches use secure WebSocket transport (WSS) with short-lived authenticated sessions. A match server assigns each player to one match and validates state-changing commands. The client sends input intent or bounded commands; it never submits authoritative score, wallet balance, rank, placement or final result.

Supabase Realtime Broadcast and Presence remain a prototype friend-room transport only. They are not the production authority for ranked matches.

### 21.2 Message envelope
Every message includes protocol version, message type, match ID, sender/session identity, monotonically increasing sequence number and validated payload. Client timestamps may assist diagnostics but are not trusted for competitive decisions. Server messages include server sequence and authoritative tick. Reject unknown protocol versions, malformed or oversized payloads, stale sequences and unauthorized message types.

### 21.3 Client-to-server commands
- PLAYER_INPUT: bounded directional/action state.
- USE_INTERACTION: objective or landmark ID; server checks distance, availability and prerequisites.
- READY_STATE: party/match readiness.
- CLIENT_PING: latency measurement.
- LEAVE_MATCH: intentional departure request.

No client command may directly set currency, XP, rank, placement, objective completion or another player's state.

### 21.4 Server-to-client events
MATCH_STATE; WORLD_SNAPSHOT; PLAYER_JOINED; PLAYER_LEFT; OBJECTIVE_UPDATED; HAZARD_PHASE; PLAYER_STATUS; MATCH_RESULT; and ERROR. Errors expose safe codes and recovery hints, not secrets or internal stack traces.

### 21.5 Timing and interpolation
Use a fixed authoritative simulation tick. An initial engineering target may be 20 ticks per second for a lightweight 2D MVP, subject to profiling. Clients render at device frame rate and interpolate remote snapshots. Local input prediction is reconciled against authoritative snapshots. Tick rate, snapshot frequency and interpolation buffer are configurable and load-tested.

### 21.6 Disconnect and reconnect
A disconnected player retains a temporary reservation for a configurable grace period. Reconnection requires a valid session and match authorization, then receives a fresh authoritative snapshot. Expired reservations follow a documented abandonment policy. Reconnect must not duplicate rewards or create two active sessions for one player in a match.

### 21.7 Current prototype boundary
The existing Supabase room exchanges player presence and position broadcasts. It does not synchronize authoritative match simulation/results. A successful two-device test proves only that room transport and remote rendering work.

## 22. Persistence and database design

### 22.1 General rules
Use UUID internal primary keys and a separate non-sequential public player ID. Store timestamps in UTC. Define foreign keys, uniqueness constraints and indexes. Check database migrations into version control. Apply row-level security to every user-owned table. Clients cannot write authoritative match outcomes, coin ledger entries, inventory ownership, XP awards or ranks. Security-sensitive changes require immutable audit records.

### 22.2 Core entities and constraints
- profiles: auth user ID (unique FK), public player ID (unique), display name, avatar key, privacy settings, timestamps.
- player_settings: user ID (unique FK), control, accessibility and audio preferences.
- friendships: requester, recipient, status and timestamps; unique unordered pair; self-friendship prohibited.
- blocks: blocker, blocked and timestamp; unique pair; self-block prohibited.
- parties: leader, mode, status, hashed invite token, expiry and creation time.
- party_members: party, user, role, ready state and joined time; unique party/user; trusted service enforces capacity.
- matches: ID, mode, status, world/ruleset versions, start/end times and validation status.
- match_players: match, user, team, placement, survival duration, verified outplays, objective score and disconnect state; unique match/user.
- match_events: match, server sequence, event type, payload version, payload and timestamp; append-only.
- player_statistics: user, mode, season and rebuildable aggregate counters.
- rank_seasons: season dates and versioned configuration.
- player_ranks: user, mode, season, rating, tier and last ranked match; unique user/mode/season.
- rank_history: user, match or adjustment, old/new rating, reason code and timestamp.
- cosmetics: item ID, slot, rarity, catalog price, availability window, asset key and enabled state.
- player_inventory: user, cosmetic, acquisition source and timestamp; uniqueness prevents unintended duplicates.
- player_loadouts: user, selected character, cosmetic slot mapping and update time.
- wallets: user, cached balance and version; balance is reconcilable from ledger.
- coin_ledger: ID, user, signed amount, reason, source reference, idempotency key and timestamp; append-only with unique per-user idempotency key.
- missions and mission_progress: versioned objective/reward definitions and per-player progress.
- achievements and player_achievements: versioned trigger definitions and unique unlock records.
- reports: reporter, target, category, match/evidence reference, review state and timestamp.
- moderation_actions: target, moderator/service, action, reason, duration and audit metadata.

### 22.3 Privacy and retention
Collect only data needed to operate the game, protect players and resolve support cases. Publish a plain-language privacy notice before account launch. Define retention and deletion workflows for account data, reports and operational logs. Never expose email, auth IDs, IP addresses or private invite tokens in public profiles or leaderboards. Provide profile visibility controls and account deletion/export workflows appropriate to the launch jurisdiction.

### 22.4 Transactions and idempotency
Reward issuance, cosmetic purchase, match completion and rank updates must be idempotent. Repeated requests with the same key return the original outcome and cannot issue duplicate currency or XP. Wallet ledger insertion and cached balance update occur atomically. Purchases verify catalog availability, price and balance server-side before recording ownership and debit.

## 23. Versioned API contracts

Production APIs are versioned under /api/v1. The framework and hosting provider may be selected during deployment, but these responsibilities remain stable.

### 23.1 Identity and profile
POST /auth/session; GET /me; PATCH /me/settings; GET /players/{publicPlayerId}. Public profile responses obey the target player's privacy settings.

### 23.2 Social and parties
POST /friends/requests; POST /friends/requests/{id}/accept; DELETE /friends/{id}; POST/DELETE /blocks/{publicPlayerId}; POST /parties; POST /parties/{id}/join; POST /parties/{id}/ready; POST /parties/{id}/invites. Invite tokens are random, short-lived, revocable and stored hashed. Rate-limit creation and redemption.

### 23.3 Matchmaking and matches
POST /matchmaking/queue; DELETE /matchmaking/queue; GET /matches/{id}; POST /matches/{id}/reconnect. Live gameplay uses the authenticated WSS protocol, not repeated REST polling.

### 23.4 Catalog, wallet and progression
GET /catalog/cosmetics; GET /me/inventory; PUT /me/loadout; GET /me/wallet; GET /me/wallet/ledger; POST /me/purchases; GET /me/statistics; GET /me/rank; GET /leaderboards/{season}/{mode}. Purchase requests contain catalog item ID and idempotency key; the client never submits a trusted price or resulting balance. Clients cannot submit trusted final match results.

### 23.5 Error contract
Errors contain a stable machine-readable code, safe user-facing message, retryable flag and correlation ID. Never return stack traces, secrets, database details or another player's private information.

## 24. Matchmaking, parties and fairness
- Squad capacity is four; Solo capacity is one.
- Party leader controls queue submission and disbanding; members may leave independently.
- All party members pass mode, version, sanction and connectivity checks.
- Matchmaking considers mode, region/latency, party composition, rating band and wait time. Rating bands may widen gradually within configured limits.
- If population is insufficient, show queue state and allow cancellation; do not promise a match.
- The match server validates roster before countdown.
- Ranked and casual queues use separate rating and reward policies.
- New accounts may complete placement matches before receiving a visible rank.
- Publish rating principles and avoid manipulative streak/loss-protection systems.

## 25. Progression, rewards and rank
A match is validated before it can issue XP, mission progress, achievements, FAB Coins or rank changes. The reward pipeline is idempotent and records a reason for each grant.

Maintain separate Solo and Squad ratings. Select a documented rating algorithm after simulation and playtesting, such as a Glicko-style or Elo-derived model with placement/performance modifiers. Do not freeze rating thresholds before playtest evidence exists. Promotion, demotion and inactivity rules are versioned season configuration. Training and casual modes do not alter ranked rating. Show rating change and a reason summary after each ranked match.

The initial economy uses earnable virtual FAB Coins only. No real-money top-ups in the MVP. Reward amounts and cosmetic prices are server configuration. No paid stat boosts, stronger abilities, paid rank boosts or randomized paid loot. The ledger is the source of truth; corrections use compensating entries rather than destructive edits.

## 26. Security threat model and controls

Threats include modified clients sending impossible movement/interactions; forged results, rank, XP or coins; replayed purchase/reward requests; room-code guessing and spam; account/session theft; denial-of-service and oversized messages; harassment, impersonation and privacy leakage; and compromised dependencies/assets.

Required controls:
1. HTTPS/WSS and secure sessions with short-lived access tokens.
2. Server authorization for every private resource and state-changing operation.
3. Strict schemas, bounds checks, rate limits and payload-size limits.
4. Server-authoritative movement envelope, cooldowns, collision, objectives, timer and results.
5. Idempotency keys and append-only wallet/rank audit records.
6. RLS tests for allowed and denied access.
7. Secret scanning and dependency review in CI.
8. Least-privilege service credentials and rotation after suspected exposure.
9. Moderation, block, report and support escalation before open social features.
10. Monitoring for unusual reward rates, impossible movement and repeated failures.

Client-side obfuscation is not anti-cheat. A client-only architecture cannot guarantee competitive integrity.

## 27. Abuse prevention and player safety
Use public player IDs rather than exposing account email or private identifiers. Nicknames have length limits and server-side normalization/filtering. Provide block, mute and report before unrestricted social interaction. Start with predefined quick messages/emotes; free text and voice chat remain disabled until moderation is operational. Rate-limit invites, friend requests, name changes and reports, with an appeal path for enforcement mistakes. Apply age-appropriate privacy and account settings. Do not add behavioral advertising or targeted monetization to the MVP. Cosmetic companions remain non-competitive and can be hidden.

## 28. Accessibility and performance
Touch controls support left/right-handed layouts, adjustable size and sensitivity. Keyboard support includes remapping and focus behavior. Essential actions have touch and keyboard paths where practical. Do not trap ordinary page navigation when gameplay is not active.

Provide high contrast, scalable text, focus indicators, status cues that do not rely on color alone, reduced motion/particles, no rapid flashing, readable hazard warnings, and separate music/effects volume. Respect operating-system reduced-motion preferences where possible.

Initial profiling targets, not guarantees: stable 30 FPS on supported mid-range Android devices with graceful reduced-effects mode; compact assets; lazy-load nonessential content; measure first interactive load, frame time, memory, asset loading and network latency. Dispose timers, listeners and network subscriptions when leaving screens or matches.

## 29. Observability and operations
Structured server logs include correlation ID, service, event type and non-sensitive identifiers. Track active sessions, queue wait, match completion, reconnect success, simulation tick duration, snapshot delay, validation failures, reward issuance, API errors and database latency. Alert on crash loops, abnormal rewards, disconnect spikes, database saturation and suspected abuse. Health endpoints must not leak configuration. Feature flags must allow ranked queues, purchases or social features to be disabled independently. Backups and restore tests are required before persistent account launch. Define incident response, player communication and rollback procedures.

## 30. Build, test and release pipeline

### 30.1 Target repository structure
The current prototype may remain in index.html during the short MVP sprint. As the project grows, migrate toward:
- src/app/ — boot and screen routing.
- src/game/ — simulation, entities, collision and match state.
- src/world/ — districts, roads, landmarks and world data.
- src/ui/ — lobby, HUD, profile, settings and results.
- src/network/ — transport adapter, protocol and reconnect.
- src/services/ — profile, inventory and progression clients.
- src/data/ — versioned configuration and catalogs.
- assets/ — compressed graphics, audio and fonts.
- tests/ — unit, integration and browser tests.
- docs/ — architecture, privacy, operations and release notes.
- supabase/migrations/ — schema and RLS migrations, if Supabase is adopted.
- server/ — authoritative match service, when introduced.

Avoid risky wholesale refactors during release-critical fixes; migrate module-by-module with tests.

### 30.2 Automated checks
Run JavaScript syntax/lint checks; unit tests for movement normalization, collision, dash cooldown, objective prerequisites, hazard transitions and rewards; schema tests for network/API messages; RLS tests for owner/non-owner/unauthenticated access; idempotency tests for rewards and purchases; integration tests for lifecycle and reconnect; browser smoke tests for home → lobby → match → results → profile; accessibility checks; dependency and secret scanning.

### 30.3 Manual device matrix
Test a lower-end Android phone, mid-range Android phone, current Android browser, desktop Chrome/Edge and narrow viewport. Include poor network, offline transitions, orientation changes, background/resume, low-power mode and repeated matches.

### 30.4 Release blockers
Block release for critical crashes, data loss, secret exposure, unauthorized data access, duplicate rewards, corrupted match state or inaccessible essential controls. Ranked release additionally requires authoritative validation, load tests, moderation, reconnect tests and security review.

## 31. Delivery gates and acceptance criteria

Gate 1 — Local playable MVP: supported phone can open the game, navigate lobby/settings, complete a local match, use movement/objectives, pause/restart, view results and retain supported local preferences without a blocking defect.

Gate 2 — Friend-room networking prototype: two separate devices with the same Supabase project and room code connect, see presence and remote avatars, disconnect and manually reconnect. This does not certify shared results or competitive fairness.

Gate 3 — Account and persistence beta: sessions work; profiles/settings persist; RLS proves users cannot access one another's private records; inventory and ledger changes are server-authorized; account recovery/deletion are documented.

Gate 4 — Authoritative online casual: server owns movement validation, world state, objectives, timer and results; clients cannot mint rewards; reconnect/failure behavior is tested; target load and latency are measured.

Gate 5 — Ranked/public release: rating/reward rules are published and validated; anti-abuse monitoring and moderation are active; privacy notice and support path exist; performance, accessibility, security and operational gates pass.

## 32. Configurable values that require evidence
Final world dimensions and spawn weights; movement speed and dash timing; match duration and safe-zone schedule; server tick/snapshot rates; hosting provider and regions; rating algorithm parameters and tier thresholds; coin rewards and cosmetic prices; reconnect grace period; retention periods and alert thresholds. Store these in versioned configuration and change them through documented balance/configuration releases.

## 33. Architecture completion definition
The architecture baseline is defined when product scope and safety boundaries; game modes and connected-world invariant; client/backend/service boundaries; simulation and match lifecycle; multiplayer protocol and authority; persistence entities and security; API contracts; progression/social rules; accessibility/performance/operations; testing and release gates; and configurable decisions are documented.

This specification defines those areas and completes the architecture baseline. It does not mean implementation, hosting, backend configuration, security review, device testing or public release is complete. Architecture completion and implementation completion must be tracked separately.


## 34. Account sign-in and cloud profile implementation addendum

Implementation status as of 2026-10-31:
- The browser client now includes an Account / Sign In screen.
- Supabase Auth integration is implemented for Google OAuth, Facebook OAuth, Discord OAuth and passwordless email one-time links.
- Auth sessions persist in the browser. External-provider passwords are never collected by FABCO.
- The client can read and write a player's own `fabco_profiles` row after the SQL schema and provider settings are configured.
- The profile snapshot includes display name, provider avatar when available, level, XP, practice statistics, achievement state, current cosmetics, cosmetic inventory and the local prototype coin balance.
- SQL schema and Row Level Security policies are provided in `supabase/fabco_profiles.sql`.
- Provider and deployment instructions are in `ACCOUNT_SETUP.md`.

Security and trust boundary:
- Row Level Security restricts each authenticated user to their own profile row.
- The current cloud snapshot is client-authored and therefore not authoritative. Coins, XP, statistics and rank must not be accepted as official competitive results or used for prizes or purchases.
- Never expose service-role keys, OAuth client secrets or database passwords in the browser or repository.
- Supabase provider configuration, allowed redirect URLs, the SQL migration and real sign-in testing are still required before account sign-in can be considered operational.
- Supabase free-tier quotas and third-party provider terms apply; there is no guarantee of unlimited free email delivery or service usage.

This addendum records an implemented client foundation, not a completed production identity, account recovery, privacy deletion, moderation or authoritative progression service.
