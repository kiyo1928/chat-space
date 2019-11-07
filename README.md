# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Chatspace DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :messages
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :images

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :users, through: :group_users
- has_many :group_users
- has_many :messages
- has_many :images


## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|string|
|group_id|integer|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :user
- belongs_to :group

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|
|group_id|integer|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :user
- belongs_to :group
- belongs_to :message
