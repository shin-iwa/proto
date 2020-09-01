class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show,]
  before_action :move_to_index,except: [:index, :show, :search]

  def index
    @articles = Article.limit(10).includes(:user).order("created_at DESC")
  end
  
  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to '/'
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to '/'
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to '/'
  end

  def show
    @novel = Novel.new
    @novels = @article.novels.includes(:user)
    # @novels = @article.novels
    @article = Article.find(params[:id])
    # @novels = @novels.find(id: params[:id])
    # @comment = Novel.find_by(id: params[:id])
    # @novels = @comment.article
  end

  def search
    @articles = Article.search(params[:keyword])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end

end

