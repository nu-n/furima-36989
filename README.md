# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| introduction       | text   |                           |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy

## destination テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| user_id            | integer | null: false, unique: true |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| post_code          | string  | null: false               |
| prefecture         | string  | null: false               |
| city               | string  | null: false               |
| address            | string  | null: false               |
| building_name      | string  |                           |
| phone_number       | string  |                           |

### Association

- belongs_to :user

## product テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| price              | string  | null: false               |
| description        | string  | null: false               |
| status             | string  | null: false               |
| size               | string  | null: false               |
| shipping_cost      | string  | null: false               |
| shipping_days      | string  | null: false               |
| prefecture_id      | string  | null: false               |
| judgment           | string  |                           |
| category_id        | integer | null: false, unique: true |
| brand_id           | integer | null: false, unique: true |
| shipping_id        | integer | null: false, unique: true |
| user_id            | integer | null: false, unique: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to_active_hash :prefecture
