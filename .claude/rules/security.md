# Security Rules

## Prohibited Files

以下のファイルをリポジトリに含めない:

- SSH秘密鍵（`~/.ssh/id_*` 等、pubファイルは可）
- トークン・パスワードが含まれるファイル
- `.env` ファイル

## Commit前の確認

シェル設定やgit設定をコミットする前に、以下が含まれていないことを確認する:

- APIキー・トークン（`export API_KEY=...` 等）
- パスワード
- プライベートなホスト名・IPアドレス
