
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

- has_many :products
- has_many :buy_data

## productsテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| name                | string     | null: false       |
| description         | text       | null: false       |
| category_id         | string     | null: false       |
| condition_id        | string     | null: false       |
| charges_id          | string     | null: false       |
| area_id             | string     | null: false       |
| ship_day_id         | string     | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_data


## street_addressテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| post_code           | string     | null: false       |
| area_id             | string     | null: false       |
| municipality        | string     | null: false       |
| house_number        | string     | null: false       |
| building_name       | string     |                   |
| phone_number        | string     | null: false       |
| buy_date            | references | foreign_key: true |

### Association

- belongs_to :buy_data

## buy_dataテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| product             | references | foreign_key: true |


belongs_to :user
belongs_to :product
has_one :street_address
