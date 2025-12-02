# Book Management App

ハッカソンプロジェクトとして、AWS学習を目的に開発する書籍管理Webアプリケーションです。

## プロジェクト概要

読んだ本を記録・管理するためのシンプルなWebアプリケーション。
AWSの各種サービス(S3, DynamoDB, Lambda, EventBridge, API Gateway)を実践的に学ぶことを主な目的としています。

## 主な機能

### コア機能
- 書籍情報の登録
  - タイトル
  - 著者
  - タグ/カテゴリ
  - 5段階評価
  - 読了日
  - 読書メモ(任意)
- 書籍情報の閲覧・更新・削除(CRUD操作)

### 実装予定の機能(オプション)
- ソート機能
- 検索・フィルタリング

## 技術スタック

- **フロントエンド**: Nuxt3 + TypeScript
- **バックエンド**: AWS Lambda (Node.js)
- **データベース**: Amazon DynamoDB
- **ストレージ**: Amazon S3
- **その他AWSサービス**: EventBridge, API Gateway
- **開発環境**: Visual Studio Code
- **バージョン管理**: GitHub
- **テスト**: 
  - フロントエンド: Vitest
  - Lambda: Jest

## 開発環境のセットアップ

### 前提条件
- Node.js (推奨バージョン: 18.x以上)
- npm
- AWSアカウント
- AWS CLI (設定済み)

### インストール手順
```bash
# リポジトリのクローン
git clone https://github.com/ryotaro-miura/AWShackathons.git
cd book-management-app

# 依存関係のインストール
npm install

# 環境変数の設定
cp .env.example .env
# .envファイルを編集してAWS認証情報などを設定
```

### 開発サーバーの起動
```bash
# Nuxt開発サーバー
npm run dev
```

## AWS設定

### 必要なAWSリソース
- DynamoDB テーブル
- S3 バケット
- Lambda 関数
- API Gateway
- EventBridge (スケジュール実行が必要な場合)

### 環境変数

`.env.example`を参考に、以下の環境変数を設定してください:
```
AWS_REGION=ap-northeast-1
DYNAMODB_TABLE_NAME=books
S3_BUCKET_NAME=book-management-bucket
API_GATEWAY_URL=https://your-api-gateway-url
```

## テスト
```bash
# フロントエンドのテスト実行
npm run test

# Lambda関数のテスト実行
npm run test:lambda

# テストカバレッジの確認
npm run test:coverage
```

## デプロイ

### Lambda関数のデプロイ
```bash
# Lambda関数のビルドとデプロイ
cd lambda
npm run build
npm run deploy
```

### フロントエンドのデプロイ
```bash
# 本番ビルド
npm run build

# 生成された.outputディレクトリをデプロイ
```

## プロジェクト構成
```
book-management-app/
├── components/          # Nuxt3 コンポーネント
├── pages/              # ページコンポーネント
├── lambda/             # Lambda関数
├── tests/              # テストファイル
├── public/             # 静的ファイル
├── .env.example        # 環境変数のサンプル
├── nuxt.config.ts      # Nuxt3設定
└── package.json
```

## 開発スケジュール

- **Week 1-2**: 基本CRUD機能とAWSインフラのセットアップ
- **Week 3**: テスト実装(必須) + オプション機能(時間があれば)

## ライセンス

このプロジェクトはハッカソン用の学習プロジェクトです。

## 作成者

三浦涼太郎

---

**Note**: このプロジェクトは3週間のハッカソンプロジェクトとして、AWS学習を主目的に開発しています。