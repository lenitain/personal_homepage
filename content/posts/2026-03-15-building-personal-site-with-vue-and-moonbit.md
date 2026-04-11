---
title: "Building a Personal Site with Vue + MoonBit"
date: "2026-03-15"
tags: ["Vue", "MoonBit", "web"]
---

I decided to build my personal homepage using an unconventional stack: Vue 3 for the frontend and MoonBit for the data layer.

## Architecture

The idea is simple — keep all site configuration and data in MoonBit, compile it to JavaScript, and let Vue consume the generated module.

```
MoonBit (data + logic) → JS → Vue (UI + rendering)
```

## Why This Stack?

MoonBit provides type-safe data definitions with pattern matching and immutability by default. It acts as a single source of truth for all site content.

## Build Pipeline

1. Write site data in `content.mbt`
2. Compile with `moon build --target js`
3. Post-process the output with a Node script to add ES module exports
4. Import in Vue composables

## Tailwind CSS v4

The styling uses Tailwind CSS v4 with its new CSS-based configuration — no more `tailwind.config.js`:

```css
@import "tailwindcss";
```

## Deployment

The site deploys to GitHub Pages on every push to `main` via a GitHub Actions workflow.
