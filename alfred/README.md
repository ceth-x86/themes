# Alfred Themes

This directory contains Alfred theme assets built from the shared Stradarium palette.

## Theme

- `stradarium-modern/theme.json` - a warm light Alfred theme aligned with `docs/colors.md`

## Recommended usage

From the project root:

```bash
make alfred-build
make alfred-package
make alfred-install
```

Available targets:

- `build/alfred/stradarium-modern/theme.json`
- `build/alfred/stradarium-modern.zip`
- installs the theme into `~/Library/Application Support/Alfred/Alfred.alfredpreferences/themes/stradarium-modern`

After `make alfred-install`, open Alfred Preferences -> `Appearance` and select `Stradarium Modern`.

## Manual install

If you do not want to use `make`, copy the theme file manually:

```bash
mkdir -p "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/themes/stradarium-modern"
cp "/Users/ceth/Documents/code/experiments/themes/alfred/stradarium-modern/theme.json" \
  "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/themes/stradarium-modern/theme.json"
```

Then open Alfred Preferences -> `Appearance` and select `Stradarium Modern`.

If the theme does not appear immediately, reopen Alfred Preferences.
