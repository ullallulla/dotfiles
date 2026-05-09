#!/bin/sh
set -euo pipefail

REPO_URL="https://github.com/dhruv8sh/kara.git"
TMP_DIR="$(mktemp -d -t kara-install-XXXXXX)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

sudo pacman -S --noconfirm --needed base-devel cmake extra-cmake-modules qt6-base qt6-declarative kwin \
  libplasma plasma-activities plasma-workspace

echo "Cloning Kara into: $TMP_DIR"
git clone --depth 1 "$REPO_URL" "$TMP_DIR"

cd "$TMP_DIR"

if [[ ! -f "./install.sh" ]]; then
  echo "Error: install.sh not found in repo root." >&2
  exit 1
fi

chmod +x ./install.sh

echo "Running Kara installer..."
./install.sh

echo "Done. Removing cloned repo..."
# (trap will remove $TMP_DIR automatically)
