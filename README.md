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

- has_many :client_service
- has_many :service_prospect
- has_many :service_order

## clients テーブル

| Column  | Type   | Options    |
| ------- | ------ | ---------- |
| name    | string | null:false |
| phone   | string |            |
| address | string |            |

### Association

- has_many :client_service
- has_many :order
- has_many :prospect
- belongs_to :user

## prospects テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| service_id           | references | null:false, foreign_key: true |
| client_id            | references | null:false, foreign_key: true |
| user_id              | references | null:false, foreign_key: true |
| scheduled_order_date | date       | null:false                    |
| license              | integer    | null:false                    |
| note                 | text       |                               |

### Association

- has_many :service_prospect
- belongs_to :user
- belongs_to :order
- belongs_to :client

## Orders テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| service_id | references | null:false, foreign_key: true |
| client_id  | references | null:false, foreign_key: true |
| user_id    | references | null:false, foreign_key: true |
| order_date | date       | null:false                    |
| expiry     | date       | null:false                    |
| license    | integer    | null:false                    |
| note       | text       |                               |

### Association

- has_many :service_order
- has_one :prospect
- belongs_to :user
- belongs_to :client

## client_service テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| client_id  | references | null:false, foreign_key: true |
| service_id | references | null:false, foreign_key: true |

### Association

- belongs_to :client
- belongs_to :service

## service_prospect テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| service_id  | references | null:false, foreign_key: true |
| prospect_id | references | null:false, foreign_key: true |

### Association

- belongs_to :service
- belongs_to :prospect

## service_order テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| service_id | references | null:false, foreign_key: true |
| order_id   | references | null:false, foreign_key: true |

### Association

- belongs_to :service
- belongs_to :order
