class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show,]
  # before_action :move_to_index,except: [:index, :show]

  def index
    @articles = Article.limit(10).includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(artrcle_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(tweet_params)
  end

  def show
    @article = Article.new
    @articles = @article.tweets.includes(:user)
  end

  # def search
  #   @tweets = Tweet.search(params[:keyword])
  # end

  private
  def article_params
    params.require(:article).permit( :title, :body).merge(user_id: current_user.id)
  end

  def set_article
    @artilce = Article.find(params[:id])
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in? 
  # end
end

