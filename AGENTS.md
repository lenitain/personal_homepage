# AGENTS.md

Personal homepage — Vue 3 + Vite + Tailwind CSS v4 frontend with MoonBit for data/logic layer.

## Dev commands

```bash
bun install              # install deps
bun run dev              # start Vite dev server (hot reload, no MoonBit rebuild)
bun run build:posts      # parse content/posts/*.md → moonbit/posts_data.mbt
bun run build:moonbit    # compile MoonBit → JS, output to src/moonbit/index.js
bun run build            # typecheck (vue-tsc) then Vite production build
bun run build:all        # posts + MoonBit + Vue build (full pipeline)
bun run preview          # preview production dist
```

## Architecture

- **MoonBit layer** (`moonbit/`): defines site data, types, JSON serialization, and project search/filter. Compiles to JS via `moon build --target js`.
- **Bridge** (`build-moonbit.js`): strips IIFE wrapper, adds ES module exports (`siteConfig`, `searchProjects`, etc.), writes to `src/moonbit/index.js`. This file is gitignored — regenerated on each build.
- **Blog posts** (`content/posts/*.md`): markdown files with YAML frontmatter (`title`, `date`, `tags`). `build-posts.js` reads them and generates `moonbit/posts_data.mbt` with embedded content.
- **Vue layer** (`src/`): `App.vue` → `useContent()` composable imports from the generated `src/moonbit/index.js`. Blog content is rendered via `marked` in `BlogLinks.vue`.
- **Tailwind v4**: configured via `@import "tailwindcss"` in `src/style.css`, with `@tailwindcss/typography` for prose styling. No `tailwind.config.js` — uses the new CSS-based config.

## Key gotchas

- **`src/moonbit/index.js` is generated** — do not edit it. It's in `.gitignore`. Always rebuild with `bun run build:moonbit` after changing any `.mbt` file.
- **`moonbit/posts_data.mbt` is generated** — do not edit it. Run `bun run build:posts` after adding/changing blog posts in `content/posts/`.
- **`bun run dev` does NOT rebuild MoonBit** — run `bun run build:moonbit` first if you changed MoonBit source, or the dev server will use stale data.
- **`bun run dev` does NOT rebuild posts** — run `bun run build:posts` first if you changed blog .md files.
- **No frontend linter/formatter** — type checking is via `vue-tsc -b` (runs during `bun run build`). No ESLint or Prettier configured.
- **MoonBit tests**: `moon test` (in `moonbit/` dir). Snapshot tests: `moon test --update`. See `moonbit/AGENTS.md` for MoonBit-specific coding conventions.
- **Deploy**: GitHub Pages on push to `main`. Full pipeline: `build-posts.js → moon build → build-moonbit.js → bun run build → deploy`. See `.github/workflows/deploy.yml`.
- **Site content**: edit `moonbit/content.mbt` (projects, skills, socials). Blog posts are in `content/posts/*.md` as the source of truth.
