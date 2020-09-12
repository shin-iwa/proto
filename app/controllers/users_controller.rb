class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.includes(:user).order("created_at DESC")
    @articles = user.articles.includes(:user).order("created_at DESC")
  end

  def search
    @users = User.search(params[:keyword])
  end
end
