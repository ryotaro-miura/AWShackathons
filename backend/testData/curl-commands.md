# API テストコマンド集

API URL: `https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books`

## 1. 基本的な書籍登録（全フィールド）

```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-001",
    "title": "リーダブルコード",
    "author": "Dustin Boswell, Trevor Foucher",
    "category": "技術書",
    "rating": 5,
    "readDate": "2024-01-15",
    "memo": "非常に読みやすく、コードの書き方について学べた。チーム全員に勧めたい一冊。"
  }'
```

## 2. 最小限のフィールドで登録

```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-002",
    "title": "1984年",
    "author": "ジョージ・オーウェル",
    "category": "小説"
  }'
```

## 3. rating・readDate・memoなしで登録

```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-001",
    "title": "クリーンアーキテクチャ",
    "author": "Robert C. Martin",
    "category": "技術書"
  }'
```

## 4. 複数の書籍を登録

### 技術書
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-001",
    "title": "Webを支える技術",
    "author": "山本陽平",
    "category": "技術書",
    "rating": 4,
    "readDate": "2024-08-01",
    "memo": "HTTPやRESTの基礎が学べる。Web開発者必読の一冊。"
  }'
```

### ビジネス書
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-001",
    "title": "人を動かす",
    "author": "デール・カーネギー",
    "category": "ビジネス",
    "rating": 5,
    "readDate": "2024-03-10",
    "memo": "人間関係の基本が詰まった名著。何度も読み返したい。"
  }'
```

### 小説
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-002",
    "title": "容疑者Xの献身",
    "author": "東野圭吾",
    "category": "小説",
    "rating": 5,
    "readDate": "2024-04-08",
    "memo": "最後のどんでん返しに驚いた。ミステリーの傑作。"
  }'
```

### 自己啓発
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-002",
    "title": "嫌われる勇気",
    "author": "岸見一郎, 古賀史健",
    "category": "自己啓発",
    "rating": 5,
    "readDate": "2024-01-25",
    "memo": "アドラー心理学の入門書として最適。対話形式で読みやすい。"
  }'
```

### 歴史
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-001",
    "title": "サピエンス全史",
    "author": "ユヴァル・ノア・ハラリ",
    "category": "歴史",
    "rating": 5,
    "readDate": "2024-05-18",
    "memo": "人類の歴史を俯瞰できる素晴らしい本。視野が広がった。"
  }'
```

## 5. エラーケースのテスト

### userIdが欠けている（400エラーになるはず）
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "テスト書籍",
    "author": "テスト著者",
    "category": "技術書"
  }'
```

### titleが欠けている（400エラーになるはず）
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "user-001",
    "author": "テスト著者",
    "category": "技術書"
  }'
```

### bodyが空（500エラーになるはず）
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json"
```

## レスポンス例

### 成功時（201 Created）
```json
{
  "bookId": "550e8400-e29b-41d4-a716-446655440000",
  "userId": "user-001",
  "sortKey": "技術書#550e8400-e29b-41d4-a716-446655440000",
  "title": "リーダブルコード",
  "author": "Dustin Boswell, Trevor Foucher",
  "category": "技術書",
  "rating": 5,
  "readDate": "2024-01-15",
  "memo": "非常に読みやすく、コードの書き方について学べた。チーム全員に勧めたい一冊。",
  "createdAt": "2024-12-05T10:30:00.000Z",
  "updatedAt": "2024-12-05T10:30:00.000Z"
}
```

### エラー時（400 Bad Request）
```json
{
  "message": "必須項目不足"
}
```

### エラー時（500 Internal Server Error）
```json
{
  "message": "サーバーエラー"
}
```

## Tips

### レスポンスを見やすくする（jqを使用）
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{...}' | jq
```

### HTTPステータスコードを表示
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{...}' \
  -w "\nHTTP Status: %{http_code}\n"
```

### 詳細なデバッグ情報を表示
```bash
curl -X POST https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books \
  -H "Content-Type: application/json" \
  -d '{...}' \
  -v
```