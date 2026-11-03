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
assert.match(html, /YOUR SEAT|SEAT \+roomSeat/, 'Player seat identity must be shown');
assert.match(html, /roomSeat/, 'Online player seat assignment must exist');
assert.match(html, /function activePlayers\(\)/, 'Turn rotation must support the selected player count');

console.log('FABCO static checks passed.');
