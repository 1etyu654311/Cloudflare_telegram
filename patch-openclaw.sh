#!/bin/bash
# سكريبت لتعديل روابط تيليجرام في OpenClaw

WORKER_URL="https://رابط-الوركر-الخاص-بك.workers.dev"

echo "[Patch] Starting Telegram API redirection to $WORKER_URL..."

# البحث عن ملفات OpenClaw وتعديلها
TARGET_DIRS=("/usr/local/lib/node_modules/openclaw" "$(npm root -g)/openclaw")

for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "[Patch] Found OpenClaw at $dir. Patching..."
        find "$dir" -type f -name "*.js" -exec sed -i "s|https://api.telegram.org|${WORKER_URL}|g" {} +
    fi
done

echo "[Patch] Done! Telegram API is now redirected."
