# DB設計
## usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| nickname           | string | null: false              |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association
has_many :purchases
has_many :items 

## itemsテーブル
| Column             | Type       | Options                       |
| ------------------ | ------     | ----------------------------- |
| name               | string     | null: false                   |
| category_id        | integer    | null: false                   |
| price              | integer    | null: false                   |
| item_state_id      | integer    | null: false                   |
| delivery_change_id | integer    | null: false                   |
| shipping_place_id  | integer    | null: false                   |
| comment            | text       | null: false                   |
| shipping_area_id   | integer    | null: false                   |
| user               | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase 

## purchasesテーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: ture |
| item               | references | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping

## shippingsテーブル
| Column          | Type       | Options                       |
| --------------- | ---------- | ------------------------------|
| post_number     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| municipalities  | string     | null: false                   |
| address         | string     | null: false                   |
| building_name   | string     |                               |
| phone_number    | string     | null: false                   |
| purchase        | references | null: false,foreign_key: true |

### Association
belongs_to :purchase