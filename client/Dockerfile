FROM node:9.11.1-alpine

# 静的コンテンツを配信するシンプルな http サーバをインストールする
RUN npm install -g http-server

ENV ROOT_PATH /client

RUN mkdir $ROOT_PATH

WORKDIR $ROOT_PATH

# カレントワーキングディレクトリ(つまり 'app' フォルダ)にプロジェクトのファイルやフォルダをコピーする
COPY . $ROOT_PATH

# プロジェクトの依存ライブラリをインストールする
RUN npm install

# 本番向けに圧縮しながらアプリケーションをビルドする
RUN npm run build

EXPOSE 9000

CMD ["http-server", "dist" ]