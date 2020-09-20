class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show,]
  before_action :move_to_index,except: [:index, :show, :search]

  def index
    @tweets = Tweet.page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to "/home/#{current_user.id}"
      flash[:notice] = "投稿が完了しました"
    else
      redirect_to "/home/#{current_user.id}"
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to "/home/#{current_user.id}"
      flash[:notice] = "投稿の削除がされました"
    else
      redirect_to "/home/#{current_user.id}"
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path
      flash[:notice] = "投稿が修正されました"
    else
      redirect_to tweet_path
      flash[:alert] = "投稿の修正に失敗しました"
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title,  :text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end
end
