@echo off
chcp 65001 > nul
REM 書籍管理APIの一括テストスクリプト（Windows用）
set API_URL=https://ujoow1zeeb.execute-api.ap-northeast-1.amazonaws.com/books

echo ===== 書籍管理API テスト開始 =====
echo.

REM 成功ケース
echo 【1】技術書を登録
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-001\",\"title\":\"リーダブルコード\",\"author\":\"Dustin Boswell, Trevor Foucher\",\"category\":\"技術書\",\"rating\":5,\"readDate\":\"2024-01-15\",\"memo\":\"非常に読みやすく、コードの書き方について学べた。チーム全員に勧めたい一冊。\"}"
echo.
echo.

timeout /t 1 /nobreak > nul

echo 【2】ビジネス書を登録
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-001\",\"title\":\"人を動かす\",\"author\":\"デール・カーネギー\",\"category\":\"ビジネス\",\"rating\":5,\"readDate\":\"2024-03-10\",\"memo\":\"人間関係の基本が詰まった名著。何度も読み返したい。\"}"
echo.
echo.

timeout /t 1 /nobreak > nul

echo 【3】小説を登録
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-002\",\"title\":\"容疑者Xの献身\",\"author\":\"東野圭吾\",\"category\":\"小説\",\"rating\":5,\"readDate\":\"2024-04-08\",\"memo\":\"最後のどんでん返しに驚いた。ミステリーの傑作。\"}"
echo.
echo.

timeout /t 1 /nobreak > nul

echo 【4】自己啓発書を登録
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-002\",\"title\":\"嫌われる勇気\",\"author\":\"岸見一郎, 古賀史健\",\"category\":\"自己啓発\",\"rating\":5,\"readDate\":\"2024-01-25\",\"memo\":\"アドラー心理学の入門書として最適。対話形式で読みやすい。\"}"
echo.
echo.

timeout /t 1 /nobreak > nul

echo 【5】歴史書を登録
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-001\",\"title\":\"サピエンス全史\",\"author\":\"ユヴァル・ノア・ハラリ\",\"category\":\"歴史\",\"rating\":5,\"readDate\":\"2024-05-18\",\"memo\":\"人類の歴史を俯瞰できる素晴らしい本。視野が広がった。\"}"
echo.
echo.

timeout /t 1 /nobreak > nul

echo 【6】最小限のフィールドで登録（オプション項目なし）
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-001\",\"title\":\"クリーンアーキテクチャ\",\"author\":\"Robert C. Martin\",\"category\":\"技術書\"}"
echo.
echo.

timeout /t 1 /nobreak > nul

REM エラーケース
echo 【エラー1】userIdが欠けている（400エラー期待）
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"title\":\"テスト書籍\",\"author\":\"テスト著者\",\"category\":\"技術書\"}" -w "\nHTTP Status: %%{http_code}\n"
echo.
echo.

timeout /t 1 /nobreak > nul

echo 【エラー2】titleが欠けている（400エラー期待）
curl -X POST %API_URL% -H "Content-Type: application/json" -d "{\"userId\":\"user-001\",\"author\":\"テスト著者\",\"category\":\"技術書\"}" -w "\nHTTP Status: %%{http_code}\n"
echo.
echo.

echo ===== テスト完了 =====
pause
