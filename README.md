# What
I am making Tweet app.

# Proto
You can check this app on <a href="http://52.192.240.140/">AWS</a>!
Please search for it on the internet.

<img width="1406" alt="screen1" src="https://user-images.githubusercontent.com/66307522/88576471-75dc8900-d080-11ea-8321-12a239eb33a4.png">

# About
This is a tweet app. You cannot actually buy ptoducts. But the basic systems has been reproduced! So please make an index of our technical level with it.

# Technology used
This application uses the following open source packages:

<img width="531" src="https://user-images.githubusercontent.com/66307522/88606810-97596700-d0b8-11ea-9ad1-b8abd6ec22de.jpg">

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
