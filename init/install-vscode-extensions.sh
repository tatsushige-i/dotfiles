#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EXTENSIONS_FILE="$SCRIPT_DIR/../vscode/extensions.txt"

if ! command -v code &>/dev/null; then
    echo "⚠ code コマンドが見つかりません。VS Code のインストールを確認してください。"
    exit 1
fi

echo "VS Code 拡張機能をインストールしています..."
while IFS= read -r ext || [[ -n "$ext" ]]; do
    [[ -z "$ext" || "$ext" == \#* ]] && continue
    code --install-extension "$ext" --force
done < "$EXTENSIONS_FILE"
echo "完了しました。"
