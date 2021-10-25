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
- belongs_to :destination

## destination テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| user_id            | references | null: false, unique: true |
| post_code          | string     | null: false               |
| prefecture_id      | integer    | null: false               |
| city               | string     | null: false               |
| address            | string     | null: false               |
| building_name      | string     |                           |
| phone_number       | string     |                           |

### Association

- belongs_to :user

## product テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| price              | string  | null: false |
| description        | string  | null: false |
| condition_id       | integer | null: false |
| shipping_cost_id   | integer | null: false |
| shipping_days_id   | integer | null: false |
| prefecture_id      | integer | null: false |
| category_id        | integer | null: false |
| user_id            | integer | null: false |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
