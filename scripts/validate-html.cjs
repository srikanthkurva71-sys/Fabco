const fs = require("node:fs");
const assert = require("node:assert/strict");

const html = fs.readFileSync("index.html", "utf8");
const scripts = [...html.matchAll(/<script\b[^>]*>([\s\S]*?)<\/script>/gi)];

assert.ok(scripts.length > 0, "index.html must contain an inline application script");
for (const [index, match] of scripts.entries()) {
  try {
    new Function(match[1]);
  } catch (error) {
    throw new Error("Inline script " + (index + 1) + " has invalid JavaScript: " + error.message);
  }
}

const ids = [...html.matchAll(/\bid=["']([^"']+)["']/g)].map((match) => match[1]);
const duplicates = ids.filter((id, index) => ids.indexOf(id) !== index);
assert.deepEqual([...new Set(duplicates)], [], "HTML element IDs must be unique");

console.log("FABCO validation passed: " + scripts.length + " inline script(s), " + ids.length + " unique IDs.");
