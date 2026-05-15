#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EXTENSIONS_FILE="$SCRIPT_DIR/../vscode/extensions.txt"

if ! command -v code &>/dev/null; then
    echo "⚠ code コマンドが見つかりません。VS Code のインストールを確認してください。"
    exit 1
fi

echo "=== VS Code extensions ==="
echo ""

local_extensions=$(code --list-extensions | sort)
repo_extensions=$(sort "$EXTENSIONS_FILE")

local_only=$(comm -23 <(echo "$local_extensions") <(echo "$repo_extensions"))
repo_only=$(comm -13 <(echo "$local_extensions") <(echo "$repo_extensions"))

diff_count=0

if [[ -n "$local_only" ]]; then
    echo "ローカルのみ（extensions.txt に未記載）:"
    while IFS= read -r ext; do
        echo "  + $ext"
        diff_count=$((diff_count + 1))
    done <<< "$local_only"
    echo ""
fi

if [[ -n "$repo_only" ]]; then
    echo "リポジトリのみ（ローカル未インストール）:"
    while IFS= read -r ext; do
        echo "  - $ext"
        diff_count=$((diff_count + 1))
    done <<< "$repo_only"
    echo ""
fi

if [[ $diff_count -eq 0 ]]; then
    echo "差分なし: extensions.txt とローカルの拡張機能は一致しています。"
else
    echo "$diff_count 件の差分があります。"
    echo "  - extensions.txt の拡張機能をインストールする場合: make vscode-extensions"
    echo "  - ローカルの状態を extensions.txt に反映する場合: make vscodesync"
fi

echo ""
