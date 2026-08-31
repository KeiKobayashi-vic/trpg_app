# 開発専用 Puma 設定

# ポート指定（rails s と同じ）
port ENV.fetch("PORT") { 3000 }

# スレッド数（開発は低負荷でOK）
threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
threads threads_count, threads_count

# 環境は development 固定
environment ENV.fetch("RAILS_ENV") { "development" }

# workers は使わない（development は単一プロセスで十分）
workers 0

# Rails の restart コマンド対応
plugin :tmp_restart
