# AGENTS.md

Personal homepage — Vue 3 + Vite + Tailwind CSS v4 frontend with MoonBit for data/logic layer.

## Dev commands

```bash
bun install              # install deps
bun run dev              # start Vite dev server (hot reload, no MoonBit rebuild)
bun run build:moonbit    # compile MoonBit → JS, output to src/moonbit/index.js
bun run build            # typecheck (vue-tsc) then Vite production build
bun run build:all        # MoonBit build + Vue build (full pipeline)
bun run preview          # preview production dist
```

## Architecture

- **MoonBit layer** (`moonbit/`): defines site data, types, JSON serialization, and project search/filter. Compiles to JS via `moon build --target js`.
- **Bridge** (`build-moonbit.js`): strips IIFE wrapper, adds ES module exports (`siteConfig`, `searchProjects`, etc.), writes to `src/moonbit/index.js`. This file is gitignored — regenerated on each build.
- **Vue layer** (`src/`): `App.vue` → `useContent()` composable imports from the generated `src/moonbit/index.js`. All site config lives in `moonbit/content.mbt`.
- **Tailwind v4**: configured via `@import "tailwindcss"` in `src/style.css`, plugin in `vite.config.ts`. No `tailwind.config.js` — uses the new CSS-based config.

## Key gotchas

- **`src/moonbit/index.js` is generated** — do not edit it. It's in `.gitignore`. Always rebuild with `bun run build:moonbit` after changing any `.mbt` file.
- **`bun run dev` does NOT rebuild MoonBit** — run `bun run build:moonbit` first if you changed MoonBit source, or the dev server will use stale data.
- **No frontend linter/formatter** — type checking is via `vue-tsc -b` (runs during `bun run build`). No ESLint or Prettier configured.
- **MoonBit tests**: `moon test` (in `moonbit/` dir). Snapshot tests: `moon test --update`. See `moonbit/AGENTS.md` for MoonBit-specific coding conventions.
- **Deploy**: GitHub Pages on push to `main`. Full pipeline: `moon build → build-moonbit.js → bun run build → deploy`. See `.github/workflows/deploy.yml`.
- **Site content**: edit `moonbit/content.mbt` (projects, skills, socials, blog posts). It's the single source of truth for all homepage data.
