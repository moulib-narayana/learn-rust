#!/bin/bash

# Other bash points:

: '
# The -e flag enables interpretation of backslash escapes (like \033 for colors) in the string.
'

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Decorative line
print_line() {
  echo -e "${MAGENTA}────────────────────────────────────────────────────────────${NC}"
}

# Section header
section() {
  print_line
  echo -e "${BOLD}${BLUE}$1${NC}"
  print_line
}

# Success message
success() {
  echo -e "${GREEN}${BOLD}✔ $1${NC}"
}

# Warning message
warn() {
  echo -e "${YELLOW}${BOLD}⚠ $1${NC}"
}

# Error message
fail() {
  echo -e "${RED}${BOLD}✖ $1${NC}"
}

# NVM setup
section "Checking for nvm & .nvmrc Node version"

NVM_DIR=$HOME/.nvm

# Step 1: Check if source of NVM exists or not. If not throw an error.

# Explanation:
#   > /dev/null      : Redirects standard output (stdout) to /dev/null, discarding it.
#   2>&1             : Redirects standard error (stderr, file descriptor 2) to wherever stdout (1) is going (here, /dev/null).
#   So, both stdout and stderr from 'source' are suppressed.
if ! source "$NVM_DIR/nvm.sh" > /dev/null 2>&1; then
  fail "Unable to load NVM. File not found at: ${BOLD}$NVM_DIR/nvm.sh${NC}"
  exit 1
fi

# Step 2: Execute the "nvm use" command and then if errors come, try to install using "nvm install".
if ! nvm use > /dev/null 2>&1; then
  warn "Attempting to use the Node.js version specified in .nvmrc..."

  if ! nvm install > /dev/null 2>&1; then
    fail "Unable to install the specified Node.js version with NVM. Please ensure the version in .nvmrc is available."
    exit 1
  fi
  nvm use > /dev/null 2>&1
  success "Node.js version $(nvm version) installed and set as default."
else
  success "Node.js version $(nvm version) already installed and set as default."
fi

# Step 3: Check if rust exists or not. If not then install the rust.
section "Checking for Rust"

if ! rustc --version > /dev/null 2>&1; then
  warn "Rust not found. Attempting to install Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  success "Rust version $(rustc --version) installed and set as default."
else
  success "Rust version $(rustc --version) already installed and set as default."
fi

# Step 4: Check if cargo exists or not. If not then install the cargo.
section "Checking for Cargo"

if ! cargo --version > /dev/null 2>&1; then
  warn "Cargo not found. Attempting to install Cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  success "Cargo version $(cargo --version) installed and set as default."
else
  success "Cargo version $(cargo --version) already installed and set as default."
fi

print_line
echo -e "${GREEN}${BOLD}✨ Setup complete! ✨${NC}"
print_line
