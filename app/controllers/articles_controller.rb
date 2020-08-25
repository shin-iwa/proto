class ArticlesController < ApplicationController
  def show
    article = Article.all
    @nickname = user.nickname
    @tweets = user.tweets.includes(:user).order("created_at DESC")
  end
end
