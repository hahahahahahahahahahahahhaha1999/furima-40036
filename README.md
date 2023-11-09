# テーブル設計

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| last_name              | string | null: false               |
| first_name             | string | null: false               |
| kana_last              | string | null: false               |
| kana_first             | string | null: false               |
| birthday               | date   | null: false               |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :purchase



## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order



## orders テーブル
 
| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| post_code              | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| municipality           | string     | null: false                    |
| street_address         | string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | string     | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

belongs_to :purchase


