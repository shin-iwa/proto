## "Proto"とは？
#### アプリケーション"Proto"は、小説投稿サイトです。

ユーザー登録なしでも、すべての小説を読むことが可能です。  
小説を書く場合やコメントをする場合には、アカウントを作成してください。

## このアプリケーションについて
このアプリは<a href="https://proto-novel.herokuapp.com/"> Heroku </a>にてご確認頂けます。  
- ID: admin  
- PASSWORD: 2323  
  
## トップページ  
<img width = "1000" alt = "screen1" src = "https://user-images.githubusercontent.com/66307522/93202826-531c4600-f78e-11ea-8531-d0a497e10911.png">

## 小説目次ページ  
<img width = "1000" alt = "screen1" src = "https://user-images.githubusercontent.com/66307522/93207493-0177b980-f796-11ea-9fab-eefd48219ee6.png">  
  
## 使用技術
このアプリケーションは、以下のオープンソースパッケージを使用しております。  
<img width="531" src="https://user-images.githubusercontent.com/66307522/93208289-5405a580-f797-11ea-8658-927c8ef25858.jpg">


## データベース

## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :tweets
- has_many :comments
- has_many :articles
- has_many :novels


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
