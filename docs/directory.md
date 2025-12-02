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
│   │   ├── types/               # バックエンド用型定義
│   │   ├── createBook.ts        # ロジック+ハンドラー
│   │   ├── getBook.ts
│   │   ├── updateBook.ts
│   │   ├── deleteBook.ts
│   │   └── listBooks.ts
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