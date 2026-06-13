#!/usr/bin/env bash

# Define source package list
LIST_FILE="live.txt"

# Verification: Check if the source file exists
if [ ! -f "$LIST_FILE" ]; then
    echo "Error: Reference file '$LIST_FILE' not found."
    exit 1
fi

echo "==> Executing high-speed dependency filtering..."

# Single-stream pipeline: Extract missing packages -> Filter out -> Bulk install
pacman -Sp $(cat "$LIST_FILE") 2>&1 >/dev/null | \
    awk -F"': " '{print $2}' | \
    grep -Fvxf - "$LIST_FILE" | \
    xargs -r sudo pacman -S --needed --noconfirm

echo "==> Infrastructure deployment process completed."
