# テーブル設計

## Users テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| nickname           | string  | null: false |
| contents           | text    | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| status             | integer | null: false |

### Association

- has_many :posts, dependent: :destroy
- has_many :follows, dependent: :destroy
- has_many :comments
- has_many :like
- has_many :categories
  enum status:{nonreleased: 0, released: 1}
- has_one_attached :image


## Posts テーブル

| Column            | Type       | Options                        |
| ------------------| -----------| ------------------------------ |
| fact              | string     | null: false                    |
| notice            | text       | null: false                    |
| category          | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_one_attached :image
- belongs_to :user
- belongs_to :category
- has_many :comments, dependent: :destroy
- has_many :likes, ->{ order(created_at: :desc)}, dependent: :destroy
- has_many :follows

## Categories テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| name                | string     | null: false                    |

### Association  

- belongs_to :user
- belongs_to :post

## Likes テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| user                | references | null: false, foreign_key: true |
| post                | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## Comments テーブル

| Column  | Type       | Options                        |
| --------| -----------| ------------------------------ |
| text    | string     | null: false                    |
| post    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Associatio
- belongs_to :user
- belongs_to :post

## Follows テーブル

| Column               | Type       | Options                        |
| ---------------------| -----------| ------------------------------ |
| following_user_id    | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Associatio
- belongs_to :user
