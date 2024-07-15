# テーブル設計

## users テーブル (ユーザー情報)　

| Column             | Type   | Options                                |
| ------------------ | ------ | -------------------------------------- |
| nickname           | string | null: false                            |
| email              | string | null: false, unique: true, default: "" |
| encrypted_password | string | null: false, default: ""               |
| first_name         | string | null: false                            |
| last_name          | string | null: false                            |
| first_name_read    | string | null: false                            |
| last_name_read     | string | null: false                            |

##　devise実装

### Association
has_many :reports
has_many :works


## report テーブル (日報情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| work               | references | null: false, foreign_key: true |
| negotiation        | string     | null: false                    |
| negotiation_obtain | string     | null: false                    |
| negotiation_lost   | string     | null: false                    |
| introspection      | text       | null: false                    |

### Association
belongs_to :user
belongs_to :work


## works テーブル (出勤記録)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| place              | float      | null: false,                   |
| check_in           | datetime   | null: false,                   |
| check_out          | datetime   | null: false,                   |

### Association
belongs_to :user
belongs_to :report



