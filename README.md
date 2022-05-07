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
