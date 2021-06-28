
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

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name_product        | string     | null: false |
| description         | text       | null: false |
| category            | string     | null: false |
| condition           | string     | null: false |
| charges             | string     | null: false |
| area                | string     | null: false |
| ship_day            | string     | null: false |
| price               | string     | null: false |
| image               |            |             |
| user                | reference  |             |

### Association

- belongs_to :user
- has_one :buy_data


## street_addressテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| post_code           | string     | null: false |
| prefecture          |            |             |
| municipality        | string     | null: false |
| house_number        | string     | null: false |
| building_name       | string     |             |
| phone_number        | string     | null: false |

### Association

- has_one :buy_data

## buy_dataテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user                | reference  |             |
| product             | reference  |             |
| street_address      | reference  |             |

belongs_to :user
belongs_to :product
belongs_to :street_address
