import { readFileSync } from 'node:fs';
import assert from 'node:assert/strict';

const html = readFileSync(new URL('../index.html', import.meta.url), 'utf8');
const ids = [...html.matchAll(/\bid=["']([^"']+)["']/g)].map(m => m[1]);
assert.equal(ids.length, new Set(ids).size, 'HTML IDs must be unique');

const inlineScripts = [...html.matchAll(/<script(?:\s[^>]*)?>([\s\S]*?)<\/script>/gi)]
  .map(m => m[1]).filter(s => s.trim());
assert.ok(inlineScripts.length > 0, 'Application JavaScript must exist');
for (const source of inlineScripts) new Function(source);

assert.match(html, /Continue with Google/, 'Google sign-in button must exist');
assert.match(html, /signInWithOAuth\(\{provider:\s*'google'/, 'Google OAuth must be wired');
assert.doesNotMatch(html, /signInWithOtp|emailRedirectTo|id=["']email["']|emailLogin|play as guest/i,
  'Email login and guest entry must not be present');
assert.match(html, /create_carrom_room/, 'Room creation RPC must be wired');
assert.match(html, /join_carrom_room/, 'Room join RPC must be wired');
assert.match(html, /config:\{private:true/, 'Realtime room channel must be private');
assert.match(html, /robotPlay/, 'Robot practice mode must exist');
assert.match(html, /pointerdown|pointermove|pointerup/, 'Touch/mouse controls must exist');
assert.match(html, /localPlayers/, 'Local pass-and-play player selector must exist');
assert.match(html, /PLAY ON THIS PHONE/, 'Local game entry must exist');
assert.match(html, /Math\.min\(1750,len\*8\)/, 'Striker power must be increased');
assert.match(html, /onlinePlayers/, 'Online room must track up to four player seats');
assert.match(html, /playerIdentity/, 'Player seat identity must be shown');
assert.match(html, /roomSeat/, 'Online player seat assignment must exist');
assert.match(html, /function activePlayers\(\)/, 'Turn rotation must support the selected player count');
assert.match(html, /const captureRadius=\(b===state\.striker\?34\+STRIKER\*\.72:34\+R\*\.72\)/, 'Pocket capture must account for the pocket mouth and each piece radius');
assert.match(html, /sinkingPieces\.push/, 'Pocketed pieces must visibly sink into the pocket');
assert.match(html, /function drawPiece\(/, 'Coins and striker must have shaded depth and contact shadows');
assert.match(html, /segmentDistance\(oldX,oldY,b\.x,b\.y,px,py\)/, 'Swept-path pocket detection must catch fast pieces crossing a hole between frames');
assert.match(html, /const leftOpen=b\.y<125\|\|b\.y>675/, 'Corner pocket channels must open through the rails');
assert.match(html, /if\(b\.x<innerMin&&!leftOpen\)/, 'Rails must rebound outside pocket channels');
assert.match(html, /ownPocketedThisShot/, 'Pocketing an own coin must be tracked for turn rules');
assert.match(html, /state\.turn=state\.turn%activePlayers\(\)\+1/, 'Turn rotation must handle all selected players');
assert.match(html, /s\.y=clamp\(p\.y,175,625\)/, 'Side-player striker must move along the vertical baseline');
assert.match(html, /s\.x=clamp\(p\.x,175,625\)/, 'Top/bottom striker must move along the horizontal baseline');

assert.match(html, /function saveGame\(\)/, 'Active game state must be persisted on the device');
assert.match(html, /function restoreSavedGame\(\)/, 'Saved games must be restored after reopening');
assert.match(html, /addEventListener\('pagehide',saveGame\)/, 'Game state must be saved when the page is closed or suspended');
assert.match(html, /visibilitychange/, 'Game state must be saved when switching apps');
assert.match(html, /event==='SIGNED_IN'/, 'Auth refreshes must not force an active game back to the lobby');


console.log('FABCO static checks passed.');
