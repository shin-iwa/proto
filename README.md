# What
We are making clone of Free Market site.

# Proto
You can check this app on <a href="http://52.192.240.140/">AWS</a>!
Please search for it on the internet.

<img width="1406" alt="screen1" src="https://user-images.githubusercontent.com/66307522/88576067-cb646600-d07f-11ea-8aec-0cef9be539c2.png">

# About
This app is clone site. You cannot actually buy ptoducts. But the basic systems has been reproduced! So please make an index of our technical level with it.

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
|image|string|
|text|text|null: false|
|user_id|integer| null: false|

### Association
- belongs_to :user
- has_many :comments


## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|string| null :false|
|tweet_id|string| null :false|

### Association
- belongs_to :tweet
- belongs_to :user 
