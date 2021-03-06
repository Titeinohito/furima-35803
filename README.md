
## usersテーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| first_name          | string     | null: false              |
| last_name           | string     | null: false              |
| first_name_kana     | string     | null: false              |
| last_name_kana      | string     | null: false              |
| email               | string     | null: false unique: true |
| encrypted_password  | string     | null: false              |
| nickname            | string     | null: false              |
| birthday            | date       | null: false              |

### Association

- has_many :items
- has_many :buy_histories

## itemsテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| name                | string     | null: false       |
| description         | text       | null: false       |
| category_id         | integer    | null: false       |
| condition_id        | integer    | null: false       |
| charge_id          | integer    | null: false       |
| area_id             | integer    | null: false       |
| ship_day_id         | integer    | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_history


## ordersテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| post_code           | string     | null: false       |
| area_id             | integer    | null: false       |
| municipality        | string     | null: false       |
| house_number        | string     | null: false       |
| building_name       | string     |                   |
| phone_number        | string     | null: false       |
| buy_history            | references | foreign_key: true |

### Association

- belongs_to :buy_history

## buy_historiesテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| item                | references | foreign_key: true |


belongs_to :user
belongs_to :item
has_one order
