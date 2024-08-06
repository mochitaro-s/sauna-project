# ベースイメージとして公式の Python イメージを使用
FROM python:3.10-slim

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係を記述したファイル（requirements.txt）をコピー
COPY requirements.txt .

# 依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションをコピー
COPY . .

# Jupyter Notebookを起動するためのコマンド
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
