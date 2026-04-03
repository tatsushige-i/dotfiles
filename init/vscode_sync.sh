#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EXTENSIONS_FILE="$SCRIPT_DIR/../vscode/extensions.txt"

if ! command -v code &>/dev/null; then
    echo "⚠ code コマンドが見つかりません。VS Code のインストールを確認してください。"
    exit 1
fi

code --list-extensions | sort > "$EXTENSIONS_FILE"
echo "extensions.txt をローカルの拡張機能で更新しました。"
