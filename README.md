# DB設計
## usersテーブル
| Column             | Type   | Options            |
| ------------------ | ------ | ------------------ |
| email              | string | null: false        |
| nicname            | string | null: false        |
| encrypted_password | string | null: false        |
| name               | string | null: false        |
| birthday           | string | null: false        |

### Association
has_many :purchases
belongs_to :items

## itemsテーブル
| Column             | Type       | Options                       |
| ------------------ | ------     | ----------------------------- |
| item               | string     | null: false                   |
| category           | string     | null: false                   |
| price              | string     | null: false                   |
| item_state         | string     | null: false                   |
| delivery_change    | string     | null: false                   |
| shipping_place     | string     | null: false                   |
| comment            | text       | null: false                   |
| shipping_area      | string     | null: false                   |
| user               | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchases

## purchaseテーブル
| Column             | Type   | Options                           |
| ------------------ | ------ | --------------------------------- |
| user               | references | null: false,foreign_key: ture |
| item               | string     | null: false                   |
| content            | text       | null: false                   |

### Association
belongs_to :users
has_one :items
belomgd_to :shipping

## shippingテーブル
| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| address  | string | null: false                   |
| user     | string | null: false,foreign_key: ture |


### Association
has_one :purchases