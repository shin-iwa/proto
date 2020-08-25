class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show,]
  before_action :move_to_index,except: [:index, :show, :search]

  def index
    @tweets = Tweet.limit(10).includes(:user, :tags).order("created_at DESC")
    @tags = Tweet.tag_counts_on(:tags).order('count DESC')
  end

  def new
    @tweet = Tweet.new
    @tweet.tag_list = "awesome, slick, hefty" # this should be familiar
    @tweet.save

    @tweet.tags # => [,,]

    @tweet.tags_count # => [,,]
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  def tag_cloud
    # order('count DESC')でカウントの多い順にタグを並べています
    @tags = Review.tag_counts_on(:tags).order('count DESC')
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text ,:tag_list).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end
end
