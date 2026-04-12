#!/usr/bin/env bash 

set -e 

# Install elan (Lean toolchain manager) if missing 
if [ ! -x "$HOME/.elan/bin/elan" ]; then 
    curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --default-toolchain leanprover/lean4:v4.29.0 \
    && elan default leanprover/lean4:v4.29.0 \
    && lean --version
fi 

# Verify tools 
"$HOME/.elan/bin/lean" --version || true 
"$HOME/.elan/bin/lake" --version || true

# Symlink dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc

# Install VS Code extensions
code --install-extension leanprover.lean4
