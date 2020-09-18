class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,except: [:index, :show, :search]
  before_action :move_to_root,only: [:edit]

  def index
    @articles = Article.page(params[:page]).per(10).order("created_at DESC")
  end
  
  def new
    @article = Article.new
    @article.novels.build
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to edit_article_path(@article)
      flash[:notice] = "続いてストーリーを投稿して下さい"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    if @article.user == current_user
      flash[:notice] = "投稿が削除されました" if @article.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  def edit
    @novels = @article.novels.includes(:user)
  end

  def update
    if @article.update(article_params)
      redirect_to edit_article_path(@article)
      flash[:notice] = "投稿が修正されました"
    else
      redirect_to edit_article_path(@article)
      flash[:alert] = "投稿の修正に失敗しました"
    end
  end

  def show
  end

  def search
    @articles = Article.search(params[:keyword])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find_by(id: params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end

  def move_to_root
    redirect_to "/" unless user_signed_in? && current_user.id == @article.user_id
  end

end

