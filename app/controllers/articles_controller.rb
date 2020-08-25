class ArticlesController < ApplicationController
  def index
    article = Article.all
    # @nickname = user.nickname
    @tweets = Tweet.limit(10).includes(:user).order("created_at DESC")
  end
end
