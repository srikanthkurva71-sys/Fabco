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

The repository currently contains an initial single-player browser prototype in index.html. It is not a complete online game.

Implemented: FABCO home screen and instructions; keyboard/mobile movement; basic arena, practice rivals and obstacles; energy pickups and shrinking safe zone; local coin/level persistence and match results.

Not implemented yet: 3D character models and selectable skins; pets and clothing inventory; cosmetic shop; the complete connected world with township, factory, campus, green belt, highlands, valley and outskirts; aircraft/helicopter arrival sequences; four-player parties and friend invitations; accounts/cloud profiles; online multiplayer; ranked matchmaking/server validation; final statistics and leaderboard services.

Architecture completion means the system design is defined; it does not mean every feature is already coded or operational.
