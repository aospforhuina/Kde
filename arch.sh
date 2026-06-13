#!/usr/bin/env bash

LIST_FILE="live.txt"
VALID_PACKAGES=()

echo "==> Filtering valid packages..."
for pkg in $(cat "$LIST_FILE"); do
    # Skip empty lines or comments
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

    # Check if package exists in repositories
    if pacman -Sp "$pkg" >/dev/null 2>&1; then
        VALID_PACKAGES+=("$pkg")
    else
        echo "  [SKIP] Invalid package: $pkg"
    fi
done

# Install all valid packages at once
if [ ${#VALID_PACKAGES[@]} -gt 0 ]; then
    echo "==> Installing valid packages..."
    sudo pacman -S --needed --noconfirm "${VALID_PACKAGES[@]}"
else
    echo "==> No valid packages found to install."
fi
