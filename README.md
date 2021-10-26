# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :products

## destination テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user_id            | references | null: false,foreign_key: ture |
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| address            | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | string     | null: false                   |

### Association

- belongs_to :address

## product テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| price              | integer    | null: false                   |
| description        | txst       | null: false                   |
| condition_id       | references | null: false,foreign_key: ture |
| shipping_cost_id   | references | null: false,foreign_key: ture |
| shipping_days_id   | references | null: false,foreign_key: ture |
| prefecture_id      | references | null: false,foreign_key: ture |
| category_id        | references | null: false,foreign_key: ture |
| user_id            | references | null: false,foreign_key: ture |

### Association

- has_many :address
- belongs_to :user

## address テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| product_id         | references | null: false,foreign_key: ture |
| destination_id     | references | null: false,foreign_key: ture |
| user_id            | references | null: false,foreign_key: ture |

- belongs_to :product
- belongs_to :user
