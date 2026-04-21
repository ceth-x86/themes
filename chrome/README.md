# Chrome Theme

This directory contains a Google Chrome theme extension built from the shared Stradarium palette.

## Files

- `manifest.json` - the Chrome theme manifest

## Build

From the project root:

```bash
make chrome-build
make chrome-package
```

This creates:

- `build/chrome/stradarium-modern/manifest.json`
- `build/chrome/stradarium-modern.zip`

## Install in Chrome

Chrome themes are installed as extensions.

### Load unpacked

1. Open `chrome://extensions`
2. Enable `Developer mode`
3. Click `Load unpacked`
4. Select `build/chrome/stradarium-modern`

### Or package first

After `make chrome-package`, you can keep the zip as a shareable artifact, then unzip it and load the extracted directory through `chrome://extensions`.

## Notes

- This is a pure theme extension, so it contains no JavaScript.
- The manifest format follows the official Chrome theme extension structure: [Chrome for Developers — What are themes?](https://developer.chrome.com/docs/extensions/develop/ui/themes)
