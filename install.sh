#!/usr/bin/env bash set 
-e 

# Install elan (Lean toolchain manager) if missing 
if [ ! -x "$HOME/.elan/bin/elan" ]; then 
    curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y 
fi 

# Ensure default Lean toolchain is installed 
"$HOME/.elan/bin/elan" default stable 

# Verify tools 
"$HOME/.elan/bin/lean" --version || true 
"$HOME/.elan/bin/lake" --version || true
