```
book-management/
├── README.md
├── .gitignore
│
├── docs/
│   ├── api-spec.md
│   ├── deployment.md
│   └── architecture.md
│
├── frontend/                      # Nuxt3フロントエンド
│   ├── components/
│   ├── pages/
│   ├── composables/
│   ├── types/                    # フロントエンド用型定義
│   ├── tests/                    # Vitest
│   ├── nuxt.config.ts
│   ├── package.json
│   └── tsconfig.json
│
├── backend/                       # Lambda関数
│   ├── dist/                     # ビルド後
│   ├── src/
│   │   ├── index.ts             # エントリーポイント（全APIのルーティング）
│   │   ├── utils/               # 各機能の実装
│   │   │   ├── createBook.ts
│   │   │   ├── getBook.ts
│   │   │   ├── updateBook.ts
│   │   │   ├── deleteBook.ts
│   │   │   └── listBooks.ts
│   │   └── types/   # バックエンド用型定義           
│   ├── tests/                   # Jest
│   ├── package.json
│   └── tsconfig.json
│
├── infrastructure/
│   ├── build.sh
│   └── deploy.sh
│
└── scripts/
    └── createZip.ts
```