class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show]
  before_action :move_to_index,except: [:index, :show]

  def index
    @articles = Article.limit(10).includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry
    Article.create(article_params)
    redirect_to "/" 
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
  end

  def show
    # @comment = Comment.new
    # @comments = @tweet.comments.includes(:user)
  end

  # def search
  #   @tweets = Tweet.search(params[:keyword])
  # end

  private
  def article_params
    params.require(:article).permit(:title, :body).merge(tweet_id: params[:tweet_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end
end

