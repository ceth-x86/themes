# Kaku Themes

This directory contains Kaku theme assets built from the shared Stradarium palette.

## Theme

- `stradarium-modern.lua` - a warm light Kaku theme in the same family as the VS Code and Alfred variants

## Recommended usage

From the project root:

```bash
make kaku-build
make kaku-package
make kaku-install
```

Available targets:

- `build/kaku/stradarium-modern.lua`
- `build/kaku/stradarium-modern.zip`
- installs the theme into `~/.config/kaku/themes/stradarium-modern.lua`

## Activate in Kaku

Add this to `~/.config/kaku/kaku.lua` after the bundled config has been loaded:

```lua
local stradarium = dofile(os.getenv('HOME') .. '/.config/kaku/themes/stradarium-modern.lua')
stradarium.apply(config)
```

This module registers the color scheme and switches `config.color_scheme` to `Stradarium Modern`.

## Manual install

If you do not want to use `make`, copy the theme file manually:

```bash
mkdir -p "$HOME/.config/kaku/themes"
cp "/Users/ceth/Documents/code/experiments/themes/kaku/stradarium-modern.lua" \
  "$HOME/.config/kaku/themes/stradarium-modern.lua"
```

Then update `~/.config/kaku/kaku.lua` with the `dofile(...)` snippet above and restart Kaku.
