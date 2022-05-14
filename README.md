# アプリケーション名

CRM-Proto

# アプリケーション概要

サブスクリプションサービスを提供する者が、顧客や受注予定、契約情報を管理するためのアプリケーションです。

# URL

https://crm-37276.herokuapp.com/

# BASIC 認証

ID：admin  
PASS：37276

# 利用方法

1.ユーザー登録する  
2.顧客情報を登録する  
3.サービス（商品）を登録する  
4.受注予定を登録する（上記 1〜3 が必須）  
5.受注予定から契約情報を登録する(上記 1〜4 が必須)

# アプリケーションを作成した背景

CRM ソフトウェアは高度な機能を有するサービスが多くリリースされていますが、搭載されている機能が多く使いにくいことが多いため、契約期間やライセンス管理といった必要な機能のみを実装したサービスを開発することにしました。

# 洗い出した要件

[要件定義](https://docs.google.com/spreadsheets/d/11pKsQ1Pa4m2Yi-eRknnPiiyw6KY3gs6m_aqKp3wFB6E/edit#gid=1696194778)

# 実装予定の機能

・ログイン制御  
・エラー画面の実装

# 開発環境

HTML, CSS, Ruby, Ruby on Rails, MySQL, Visual Studio Code

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/f01d4d7f49fe7b5f586e2f56499ed4ed.png)](https://gyazo.com/f01d4d7f49fe7b5f586e2f56499ed4ed)

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/9a9748f79be8486c0981c92d3b7c7c65.png)](https://gyazo.com/9a9748f79be8486c0981c92d3b7c7c65)

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |

### Association

- has_many :order
- has_many :prospect
- has_many :client

## Services テーブル

| Column | Type    | Options    |
| ------ | ------- | ---------- |
| name   | string  | null:false |
| price  | integer | null:false |

### Association

- has_many :prospect

## clients テーブル

| Column  | Type   | Options    |
| ------- | ------ | ---------- |
| name    | string | null:false |
| phone   | string |            |
| address | string |            |

### Association

- has_many :order
- has_many :prospect

## prospects テーブル

| Column               | Type    | Options    |
| -------------------- | ------- | ---------- |
| service_id           | integer | null:false |
| client_id            | integer | null:false |
| user_id              | integer | null:false |
| scheduled_order_date | date    | null:false |
| license              | integer | null:false |
| note                 | text    |            |

### Association

- belongs_to :user
- belongs_to :service
- belongs_to :client
- has_one :order

## Orders テーブル

| Column     | Type    | Options    |
| ---------- | ------- | ---------- |
| service_id | integer | null:false |
| client_id  | integer | null:false |
| user_id    | integer | null:false |
| order_date | date    | null:false |
| expiry     | date    | null:false |
| license    | integer | null:false |
| note       | text    |            |

### Association

- belongs_to :user
- belongs_to :client
- belongs_to :prospect
- belongs_to :service
