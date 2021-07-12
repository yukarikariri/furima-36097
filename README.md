# README

# usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| familyname_kana    | string     | null: false                    |
| firstname_kana     | string     | null: false                    |
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
| category_id        | integer    | numericality: other_than: 1    | ※ActiveHashで実装
| condition_id       | integer    | numericality: other_than: 1    | ※ActiveHashで実装
| charge_id          | integer    | numericality: other_than: 1    | ※ActiveHashで実装
| prefecture_id      | integer    | numericality: other_than: 1    | ※ActiveHashで実装
| leadtime_id        | integer    | numericality: other_than: 1    | ※ActiveHashで実装
| item_price         | integer     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item_category
- belongs_to :item_condition
- belongs_to :delivery_charge
- belongs_to :prefecture
- belongs_to :lead_time


# purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| card_expire_year   | string     | null: false                    |
| card_expire_month  | string     | null: false                    |
| security_code      | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user


# addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | numericality: other_than: 1    | ※ActiveHashで実装
| town               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchase_id        | references | null: false, foreign_key: true |

### Association
belongs_to :prefecture