# Random Commander Finder — TODO

Features to add, roughly in priority order.

## Planned

- [~] **Host it on the web** — repo is on GitHub (BenSimpsonDigital/RandomCommander); deploying via Cloudflare Pages (Git-connected). Connect the repo in the Cloudflare dashboard to finish. Serving over HTTPS also fixes the `file://` "Failed to fetch" issue.
- [ ] **AI-powered pairing recommendations** — eventually swap/augment the EDHREC pairings with Claude-generated, commander-specific suggestions. Needs a small backend to hold the API key. See notes in `~/.claude/.../memory/ai-pairings-idea.md`.

### Ideas backlog (from brainstorm)
- Share + card detail: deep-link the dealt commander via URL; rendered mana symbols / P-T / price / legality; art-crop background; rulings; "open in Moxfield/Archidekt/EDHREC"; buy links.
- Pairings & combos: hover-to-enlarge previews; Commander Spellbook combo finder; budget-cap suggestions; more EDHREC category groups.
- UX/polish: keyboard deal (Space/Enter); shuffle-through animation; main-card loading skeleton; PWA/installable; downloadable result image.
- Fun mode: deckbuilding-challenge generator; constraint wheel.

## Done

- [x] **Save / favourite commanders** — ♥ Save toggle on the card, persisted to `localStorage`; a Saved drawer to browse/remove/re-display; reachable before the first deal.
- [x] **Cloud-sync saved commanders** — optional Supabase backend (email 6-digit-code auth) mirrors saves to a per-user RLS table; localStorage stays as offline cache + graceful fallback. Activates once `SUPABASE_URL`/`ANON_KEY` are filled in `index.html`. Schema in `supabase-setup.sql`.
- [x] **Session history** — Prev/Next arrows to walk back through commanders dealt this session; "don't repeat this session" re-roll.
- [x] **Better filters** — Format (Commander/Brawl), Colour count (Any/Mono/2-colour/3+), Commander MV slider, Max-price slider, Partners-only toggle; Power Bias simplified to Surprise me / Powerful.
