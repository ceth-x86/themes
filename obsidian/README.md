# Obsidian Theme Snippet

This directory contains a Minimal-friendly Obsidian CSS snippet built from the shared Stradarium palette.

## File

- `stradarium_theme.css` - the main snippet for Obsidian with balanced paper/panel surfaces, restrained accents, and stronger editor/sidebar separation

## Install with make

Obsidian snippets are stored inside a specific vault, so the install target needs your vault snippet path.

Example:

```bash
OBSIDIAN_SNIPPETS_DIR="$HOME/path/to/your-vault/.obsidian/snippets" make obsidian-install
```

This copies:

- `obsidian/stradarium_theme.css`

to:

- `$OBSIDIAN_SNIPPETS_DIR/stradarium_theme.css`

After that:

1. Open Obsidian.
2. Go to `Settings -> Appearance -> CSS snippets`.
3. Reload snippets if needed.
4. Enable `stradarium_theme.css`.

## Build

If you want a build artifact first:

```bash
make obsidian-build
```

This creates:

- `build/obsidian/stradarium_theme.css`

## Manual install

```bash
mkdir -p "$HOME/path/to/your-vault/.obsidian/snippets"
cp "/Users/ceth/Documents/code/experiments/themes/obsidian/stradarium_theme.css" \
  "$HOME/path/to/your-vault/.obsidian/snippets/stradarium_theme.css"
```
