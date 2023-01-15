# README

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| name               | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| profile            | string | null: false             |

- has_many :plans
- has_many :comments

## plans テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| user                  | references | null: false foreign_key: true |
| title                 | string     | null: false                   |
| detail                | text       | null: false                   |
| category_id           | integer    | null: false                   |
 
- belongs_to :user
- has_many   :comments

## comments テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| user                  | references | null: false foreign_key: true |
| text                  | text       | null: false                   |
 
- belongs_to :user
- has_one    :plan