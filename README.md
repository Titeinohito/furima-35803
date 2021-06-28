
## usersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| name_kana           | string     | null: false |
| email               | string     | null: false |
| password            | string     | null: false |
| nickname            | string     | null: false |
| birthday            | string     | null: false |

### Association

- has_many :products
- has_many :buyers

## productsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name_product        | string     | null: false |
| description         | string     | null: false |
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
- has_one :buyer


## buyersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| creditcard_number   | string     | null: false |
| creditcard_date     | string     | null: false |
| creditcard_code     | string     | null: false |
| post_code           | string     | null: false |
| prefecture          | string     | null: false |
| municipality        | string     | null: false |
| house_number        | string     | null: false |
| building_number     | string     | null: false |
| phone_number        | string     | null: false |
| user                | reference  |             |
| product             | reference  |             |

### Association

- belongs_to :user
- belongs_to :product