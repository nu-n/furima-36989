# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| birth_day          | date       | null: false                   |

### Association

- has_many :products
- has_many :addresses

## destinations テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| addresses          | references | null: false,foreign_key: ture |
| building_name      | string     |                               |
| phone_number       | string     | null: false                   |

### Association

- belongs_to :address

## products テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| price              | integer    | null: false                   |
| description        | text       | null: false                   |
| condition_id       | integer    | null: false,unique: true      |
| shipping_cost_id   | integer    | null: false,unique: true      |
| shipping_days_id   | integer    | null: false,unique: true      |
| prefecture_id      | integer    | null: false,unique: true      |
| category_id        | integer    | null: false,unique: true      |
| user               | references | null: false,unique: true      |

### Association

- belongs_to :address
- belongs_to :user

## addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| product            | references | null: false,foreign_key: ture |
| user               | references | null: false,foreign_key: ture |

- belongs_to :product
- belongs_to :user
