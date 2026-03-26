# Dotfiles Conventions

## Workflow

- 1 Issue = 1 PR
- Issue には type label と priority label を必ず付与する

## Branch Naming

| Label | Prefix |
|---|---|
| `feature` | `feature/` |
| `enhancement` | `enhance/` |
| `chore` | `chore/` |

Format: `<prefix><concise-english-description>` (hyphens separated)

## Labels

### Type Labels (select one)

| Label | Criteria |
|---|---|
| `feature` | 新しいdotfile・ツールの追加 |
| `enhancement` | 既存設定の改善・拡張 |
| `chore` | CI/CD、リポジトリ運用、リファクタリング等 |

### Priority Labels (select one)

| Label | Criteria |
|---|---|
| `priority: high` | 即対応が必要 |
| `priority: medium` | 通常の開発フローで対応 |
| `priority: low` | 急ぎではない改善 |

## Issue and PR Language

タイトル・本文は日本語で記載する。

## Autonomous Action Restrictions

明示的な指示がない限り以下を実行しない:

- git commit / push
- Issue・PRのステータス変更
