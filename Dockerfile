# 使用するPythonのバージョンを指定
FROM python:3.10-slim

# 必要なシステムパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pipのアップグレードとJupyterのインストール
RUN pip install --upgrade pip \
    && pip install jupyter

# 作業ディレクトリを設定
WORKDIR /app

# アプリケーションのポートを公開
EXPOSE 8000

# コンテナが起動してからも常に動作し続けるように設定
CMD ["tail", "-f", "/dev/null"]