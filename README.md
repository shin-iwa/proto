# What
I am making Novel Posting site.

# Proto
You can check this app on <a href="">AWS</a>!
Please search for it on the internet.

<img width="1000" alt="screen1" src="https://user-images.githubusercontent.com/66307522/93202826-531c4600-f78e-11ea-8531-d0a497e10911.png">

# About
This app is Novel Posting site. You can use full systems! It,s possible to read all novels. But if you write new novels, please make an account.

# Technology used
This application uses the following open source packages:

<img width="531" src="https://user-images.githubusercontent.com/66307522/88165235-5a244d80-cc50-11ea-9012-f2c9222a056b.JPG">

# Database

## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :tweets
- has_many :comments


## tweets table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user
- has_many :comments


## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false|
|tweet_id|integer|null: false|

### Association
- belongs_to :tweet
- belongs_to :user 

## articles table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|user_id|references| null: false|

### Association
- belongs_to :user
- has_many :novels


## novels table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|user_id|references|null: false, foreign_key: true|
|article_id|references|null: false, foreign_key: true|

### Association
- belongs_to :article
- belongs_to :user 
