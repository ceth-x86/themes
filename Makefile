ALFRED_THEME_NAME := stradarium-modern
ALFRED_THEME_SRC_DIR := alfred/$(ALFRED_THEME_NAME)
ALFRED_THEME_SRC_FILE := $(ALFRED_THEME_SRC_DIR)/theme.json
ALFRED_BUILD_DIR := build/alfred/$(ALFRED_THEME_NAME)
ALFRED_BUILD_FILE := $(ALFRED_BUILD_DIR)/theme.json
ALFRED_ZIP_FILE := build/alfred/$(ALFRED_THEME_NAME).zip
ALFRED_INSTALL_DIR := $(HOME)/Library/Application Support/Alfred/Alfred.alfredpreferences/themes/$(ALFRED_THEME_NAME)

KAKU_THEME_NAME := stradarium-modern
KAKU_THEME_SRC_FILE := kaku/$(KAKU_THEME_NAME).lua
KAKU_BUILD_DIR := build/kaku
KAKU_BUILD_FILE := $(KAKU_BUILD_DIR)/$(KAKU_THEME_NAME).lua
KAKU_ZIP_FILE := $(KAKU_BUILD_DIR)/$(KAKU_THEME_NAME).zip
KAKU_INSTALL_DIR := $(HOME)/.config/kaku/themes

OBSIDIAN_THEME_NAME := stradarium_theme
OBSIDIAN_THEME_SRC_FILE := obsidian/$(OBSIDIAN_THEME_NAME).css
OBSIDIAN_BUILD_DIR := build/obsidian
OBSIDIAN_BUILD_FILE := $(OBSIDIAN_BUILD_DIR)/$(OBSIDIAN_THEME_NAME).css

CHROME_THEME_NAME := stradarium-modern
CHROME_THEME_SRC_DIR := chrome
CHROME_BUILD_DIR := build/chrome/$(CHROME_THEME_NAME)
CHROME_ZIP_FILE := build/chrome/$(CHROME_THEME_NAME).zip

VS_CODE_EXTENSION_NAME := stradarium-modern
VS_CODE_BUILD_DIR := build/vs_code
VS_CODE_BUILD_FILE := $(VS_CODE_BUILD_DIR)/$(VS_CODE_EXTENSION_NAME).vsix
VSCE_BIN := /opt/homebrew/bin/vsce
CODE_BIN := /opt/homebrew/bin/code

.PHONY: help alfred-build alfred-package alfred-install kaku-build kaku-package kaku-install obsidian-build obsidian-install chrome-build chrome-package vscode-build vscode-install clean

help:
	@printf "Targets:\n"
	@printf "  make alfred-build    Copy Alfred theme into build/alfred\n"
	@printf "  make alfred-package  Create a zip archive for the Alfred theme\n"
	@printf "  make alfred-install  Install the Alfred theme into your local Alfred preferences\n"
	@printf "  make kaku-build      Copy Kaku theme into build/kaku\n"
	@printf "  make kaku-package    Create a zip archive for the Kaku theme\n"
	@printf "  make kaku-install    Install the Kaku theme into ~/.config/kaku/themes\n"
	@printf "  make obsidian-build  Copy Obsidian snippet into build/obsidian\n"
	@printf "  make obsidian-install Install the Obsidian snippet into a vault snippets directory\n"
	@printf "                       Use OBSIDIAN_SNIPPETS_DIR=/path/to/vault/.obsidian/snippets\n"
	@printf "  make chrome-build    Copy the Chrome theme into build/chrome\n"
	@printf "  make chrome-package  Create a zip archive for the Chrome theme\n"
	@printf "  make vscode-build    Package the VS Code theme into build/vs_code\n"
	@printf "  make vscode-install  Install the packaged VS Code theme locally\n"
	@printf "  make clean           Remove build artifacts\n"

alfred-build:
	@mkdir -p "$(ALFRED_BUILD_DIR)"
	@cp "$(ALFRED_THEME_SRC_FILE)" "$(ALFRED_BUILD_FILE)"
	@printf "Built %s\n" "$(ALFRED_BUILD_FILE)"

alfred-package: alfred-build
	@mkdir -p "$(dir $(ALFRED_ZIP_FILE))"
	@rm -f "$(ALFRED_ZIP_FILE)"
	@cd build/alfred && zip -rq "$(notdir $(ALFRED_ZIP_FILE))" "$(ALFRED_THEME_NAME)"
	@printf "Packaged %s\n" "$(ALFRED_ZIP_FILE)"

alfred-install: alfred-build
	@mkdir -p "$(ALFRED_INSTALL_DIR)"
	@cp "$(ALFRED_BUILD_FILE)" "$(ALFRED_INSTALL_DIR)/theme.json"
	@printf "Installed theme to %s\n" "$(ALFRED_INSTALL_DIR)"

kaku-build:
	@mkdir -p "$(KAKU_BUILD_DIR)"
	@cp "$(KAKU_THEME_SRC_FILE)" "$(KAKU_BUILD_FILE)"
	@printf "Built %s\n" "$(KAKU_BUILD_FILE)"

kaku-package: kaku-build
	@mkdir -p "$(KAKU_BUILD_DIR)"
	@rm -f "$(KAKU_ZIP_FILE)"
	@cd "$(KAKU_BUILD_DIR)" && zip -q "$(notdir $(KAKU_ZIP_FILE))" "$(notdir $(KAKU_BUILD_FILE))"
	@printf "Packaged %s\n" "$(KAKU_ZIP_FILE)"

kaku-install: kaku-build
	@mkdir -p "$(KAKU_INSTALL_DIR)"
	@cp "$(KAKU_BUILD_FILE)" "$(KAKU_INSTALL_DIR)/$(KAKU_THEME_NAME).lua"
	@printf "Installed theme to %s/%s.lua\n" "$(KAKU_INSTALL_DIR)" "$(KAKU_THEME_NAME)"

obsidian-build:
	@mkdir -p "$(OBSIDIAN_BUILD_DIR)"
	@rm -f "$(OBSIDIAN_BUILD_DIR)/stradarium.css"
	@cp "$(OBSIDIAN_THEME_SRC_FILE)" "$(OBSIDIAN_BUILD_FILE)"
	@printf "Built %s\n" "$(OBSIDIAN_BUILD_FILE)"

obsidian-install: obsidian-build
	@test -n "$(OBSIDIAN_SNIPPETS_DIR)" || { printf "Set OBSIDIAN_SNIPPETS_DIR to your vault's .obsidian/snippets directory\n" >&2; exit 1; }
	@mkdir -p "$(OBSIDIAN_SNIPPETS_DIR)"
	@cp "$(OBSIDIAN_BUILD_FILE)" "$(OBSIDIAN_SNIPPETS_DIR)/$(OBSIDIAN_THEME_NAME).css"
	@printf "Installed snippet to %s/%s.css\n" "$(OBSIDIAN_SNIPPETS_DIR)" "$(OBSIDIAN_THEME_NAME)"

chrome-build:
	@mkdir -p "$(CHROME_BUILD_DIR)"
	@cp "$(CHROME_THEME_SRC_DIR)/manifest.json" "$(CHROME_BUILD_DIR)/manifest.json"
	@printf "Built %s\n" "$(CHROME_BUILD_DIR)"

chrome-package: chrome-build
	@mkdir -p "$(dir $(CHROME_ZIP_FILE))"
	@rm -f "$(CHROME_ZIP_FILE)"
	@cd build/chrome && zip -rq "$(notdir $(CHROME_ZIP_FILE))" "$(CHROME_THEME_NAME)"
	@printf "Packaged %s\n" "$(CHROME_ZIP_FILE)"

vscode-build:
	@mkdir -p "$(VS_CODE_BUILD_DIR)"
	@rm -f "$(VS_CODE_BUILD_DIR)"/*.vsix
	@cd vs_code && "$(VSCE_BIN)" package --out "../$(VS_CODE_BUILD_FILE)"
	@printf "Built %s\n" "$(VS_CODE_BUILD_FILE)"

vscode-install: vscode-build
	@"$(CODE_BIN)" --install-extension "$(VS_CODE_BUILD_FILE)" --force
	@printf "Installed extension from %s\n" "$(VS_CODE_BUILD_FILE)"

clean:
	@rm -rf build
	@printf "Removed build artifacts\n"
