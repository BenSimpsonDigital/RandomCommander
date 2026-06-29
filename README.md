# The Dealing Stone — Random Commander Finder

A single-page app that deals you a random MTG Commander from [Scryfall](https://scryfall.com),
then reveals the cards that pair best with it. No backend, no build step, no API key.

## Use it

Just open `index.html` in any browser, or double-click it. That's the whole app.

## Deploy it

It's a single static file, so anything works:

- **GitHub Pages** — push the repo, enable Pages on the `main` branch / root. Done.
- **Vercel / Netlify** — drag the folder in, or point it at the repo. No build command, output dir is `.`.

## How it works

- **Deal** queries `is:commander legal:commander` plus your filters:
  - **Colors** → `id<=` (within these colors) or `id=` (exact identity) when the toggle is on.
  - **Theme** → curated Scryfall oracle-tags (`otag:counters-matter`, `otag:sacrifice-outlet`, …)
    or type/oracle clauses (`t:dinosaur`, `o:"instant or sorcery"`). Tribal opens a creature-type sub-picker.
  - **Power bias** → *Surprise me* uses `/cards/random`; *Powerful* picks from the top of
    `order=edhrec`; *Budget* adds `usd<=8`.
  - If nothing matches every filter, it relaxes them (drop theme → drop colors) so the button never dead-ends.
- **Pairings** scopes to the commander's color identity (`id<=`), `-is:commander`, grouped into
  Ramp / Removal / Card Advantage / Protection (+ a theme-payoff group), each sorted by EDHREC rank.
  Results are cached per commander.

All card data and images are © their respective owners, served by the Scryfall API.
Not affiliated with Wizards of the Coast.
