#!/usr/bin/env bash
# install-macos.sh
# Script instalasi dan symlinking konfigurasi dotfiles untuk macOS

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}"

echo "=========================================="
echo "  Dotfiles Installer (macOS)             "
echo "=========================================="
echo "Dotfiles Root: ${DOTFILES_DIR}"
echo "Config Path  : ${CONFIG_DIR}"
echo ""

mkdir -p "${CONFIG_DIR}"

# 1. Alacritty
echo "[1/2] Linking Alacritty..."
mkdir -p "${CONFIG_DIR}/alacritty"
ln -sfn "${DOTFILES_DIR}/shared/alacritty/alacritty.toml" "${CONFIG_DIR}/alacritty/alacritty.toml"
echo "  ✓ Alacritty config berhasil di-symlink!"

# 2. Zed
echo "[2/2] Linking Zed..."
mkdir -p "${CONFIG_DIR}/zed"
ln -sfn "${DOTFILES_DIR}/shared/zed/settings.json" "${CONFIG_DIR}/zed/settings.json"
ln -sfn "${DOTFILES_DIR}/shared/zed/AGENTS.md" "${CONFIG_DIR}/zed/AGENTS.md"
echo "  ✓ Zed config & AGENTS.md berhasil di-symlink!"

echo ""
echo "Selesai! Konfigurasi macOS telah terhubung dengan dotfiles repo."
