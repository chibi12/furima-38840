# DB設計
## usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| nicname            | string | null: false              |
| encrypted_password | string | null: false              |
| identification     | stripe | null: false              |
| name               | string | null: false              |
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
| shipping_area_id   | string     | null: false                   |
| user               | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchases 

## purchaseテーブル
| Column             | Type   | Options                           |
| ------------------ | ------ | --------------------------------- |
| user               | references | null: false,foreign_key: ture |
| item               | string     | null: false                   |

### Association
belongs_to :user
belongs_to :items
belomgd_to :shipping

## shippingテーブル
| Column          | Type    | Options     |
| --------------- | ------- | ------------|
| card_number     | integer | null: false |
| date_of_expiry  | date    | null: false |
| security_code   | integer | null: false |
| post_number     | integer | null: false |
| prefectures_id  | integer | null: false |
| municipalities  | string  | null: false |
| address         | string  | null: false |
| building_name   | string  | null: false |
| phone_number    | integer | null: false |

### Association
has_one :purchases