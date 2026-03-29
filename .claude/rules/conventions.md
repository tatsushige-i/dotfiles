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

## Makefile

### Script Placement

初期化・セットアップ用スクリプトは `init/` ディレクトリに配置する（`scripts/` は使用しない）。

### Target Order

ターゲットの記載順は **Setup → Maintenance** の順とする（README の構成と一致させる）。

### make init への追加基準

新しいセットアップ手順を追加する場合、初期セットアップ（新しいマシンへの環境構築）に必要であれば `init:` の依存に含める。
