# README

# usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :purchases


# itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_image         |                                             | ※ActiveStorageで実装  
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    | ※ActiveHashで実装
| condition_id       | integer    | null: false                    | ※ActiveHashで実装
| charge_id          | integer    | null: false                    | ※ActiveHashで実装
| prefecture_id      | integer    | null: false                    | ※ActiveHashで実装
| leadtime_id        | integer    | null: false                    | ※ActiveHashで実装
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :charge
- belongs_to :prefecture
- belongs_to :leadtime
- has_one :purchase



# purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


# addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    | ※ActiveHashで実装
| town               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association
belongs_to :prefecture
belongs_to :purchases