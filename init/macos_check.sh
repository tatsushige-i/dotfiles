#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MACOS_SH="$SCRIPT_DIR/macos.sh"

diff_count=0

while IFS= read -r line; do
    [[ "$line" =~ ^defaults\ write\ ([^\ ]+)\ ([^\ ]+)\ (-bool|-string|-int)\ (.+)$ ]] || continue

    domain="${BASH_REMATCH[1]}"
    key="${BASH_REMATCH[2]}"
    type="${BASH_REMATCH[3]}"
    expected="${BASH_REMATCH[4]}"

    case "$type" in
        -bool)
            [[ "$expected" == "true" ]] && expected="1" || expected="0"
            ;;
        -string)
            expected="${expected//\"/}"
            ;;
        -int)
            ;;
    esac

    current=$(defaults read "$domain" "$key" 2>/dev/null || echo "<not set>")

    if [[ "$current" != "$expected" ]]; then
        echo "DIFF: $domain $key"
        echo "  expected : $expected"
        echo "  current  : $current"
        diff_count=$((diff_count + 1))
    fi
done < "$MACOS_SH"

if [[ $diff_count -eq 0 ]]; then
    echo "差分なし: macos.sh の全設定が現在の値と一致しています。"
else
    echo ""
    echo "$diff_count 件の差分があります。"
    echo "  - macos.sh の設定をMacに適用する場合: make macos"
    echo "  - Mac の現在値を macos.sh に反映する場合: macos.sh を手動編集してください"
fi
