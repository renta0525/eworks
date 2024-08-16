# アプリケーション名

eworks

# アプリケーション概要

出勤管理アプリ。日報、位置情報の収集ができる。

# URL

https://eworks.onrender.com

# 利用方法

## 出勤機能

1.トップページから新規登録を行う

2.「出勤」ボタンを押す

## 日報提出

1.ログイン時のヘッダーから「日報」を押す

2.「新規投稿」ボタンを押す

3.各項目の記入（商談数・成約数・失注数・反省点）を行い、「提出」ボタンを押す

# アプリケーションを作成した背景

現職では、各地の携帯ショップや家電量販店に配属される営業職であり、出勤したら時間の分かるものを写真で送るシステムになっている。しかし、最近出勤日に出勤せず家の時計の写真を撮って送るということが多々あると聞いたので、今回そのようなことを解決するため、出勤時間と位置情報を取得できるアプリケーションを作成した。

# 今後実装予の機能

出勤のみでなく、休憩、退勤時間も取得できるように実装予定。

# テーブル設計

## users テーブル (ユーザー情報)　


| Column             | Type   | Options                　               |
| ------------------ | ------ | -------------------------------------- |
| nickname           | string | null: false                            |
| email              | string | null: false, unique: true, default: "" |
| encrypted_password | string | null: false, default: ""               |
| first_name         | string | null: false                            |
| last_name          | string | null: false                            |
| first_name_read    | string | null: false                            |
| last_name_read     | string | null: false                            |

devise実装

### Association
has_many :reports

has_many :works


## report テーブル (日報情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| work               | references | null: false, foreign_key: true |
| negotiation        | string     | null: false                    |
| negotiation_obtain | string     | null: false                    |
| negotiation_lost   | string     | null: false                    |
| introspection      | text       | null: false                    |

### Association
belongs_to :user

belongs_to :work


## works テーブル (出勤記録)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| place              | string     | null: false                   |
<!-- | check_in           | datetime   | null: false,                   | 一旦create_atでいく -->

### Association
belongs_to :user

belongs_to :report

# 開発環境

・フロントエンド

・バックエンド

・インフラ

・テキストエディタ

・タスク管理

# ローカルでの動作方法

以下のコマンドを順に実行。

% git clone https://github.com/renta0525/eworks.git

% cd repository

% bundle install

% rails db:create

% rails db:migrate

# 工夫したポイント

リアルタイムで時間を表示し、日時が分かりやすいようにした。



