#!/usr/bin/env bash
# Config installation script
# Prerequisites: Homebrew (https://brew.sh)
# Usage: ./install.sh

set -e

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config}"
ZSHENV="$HOME/.zshenv"

# ---- Check for Homebrew ----
if ! command -v brew &>/dev/null; then
    echo "Error: Homebrew is required. Install from https://brew.sh"
    exit 1
fi

echo "==> Installing dependencies via Homebrew..."

# Core tools
brew install neovim zsh
brew install eza fzf zoxide bat duf
brew install thefuck gh

# Postgres 
brew install postgresql@17 

echo "==> Brew installation complete."

# ---- Git submodules (nvim config) ----
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/.gitmodules" ]]; then
    echo "==> Initializing git submodules..."
    (cd "$SCRIPT_DIR" && git submodule update --init --recursive)
fi

# ---- ZDOTDIR setup for zsh config ----
ZDOTDIR_LINE='export ZDOTDIR="${HOME}/.config/zsh"'
if [[ -f "$ZSHENV" ]]; then
    if grep -q 'ZDOTDIR' "$ZSHENV"; then
        echo "==> ZDOTDIR already set in $ZSHENV"
    else
        echo "" >> "$ZSHENV"
        echo "# Config repo - loads zsh from ~/.config/zsh" >> "$ZSHENV"
        echo "$ZDOTDIR_LINE" >> "$ZSHENV"
        echo "==> Added ZDOTDIR to $ZSHENV"
    fi
else
    echo "$ZDOTDIR_LINE" >> "$ZSHENV"
    echo "==> Created $ZSHENV with ZDOTDIR"
fi

echo ""
echo "==> Install complete!"
echo "    Restart your shell or run: exec zsh"
echo ""
echo "    Optional: Install NVM for Node.js:"
echo "    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash"
