class NovelsController < ApplicationController
  before_action :set_novel, only: [:edit, :show,]
  # def new
  #   @tweet = Tweet.new
  # end

  def index

    # これはnovel index->novel show の連携をしたい時用

    # @novel = Novel.new
    @article = Article.find(params[:article_id])
    # @novels = Novel.includes(:article)

    # これはarticle index->novel index の連携をしたい時用
    
    # @novel = Novel.new
    # @article = Article.find(params[:article_id])
    @novels = @article.novels.includes(:user)

  end

  def create
    Novel.create(novel_params)
    redirect_to '/'
  end

  def show
    # @novel = Novel.new
    # @article = Article.find(params[:id])
    # @novels = @article.novels.includes(:user)

    @novel = Novel.find(params[:id])

    # @article = Article.find(params[:id])
    # @novels = @article.novels.preload(:user).page(params[:page]).per(1)
    # @novel = Novel.find(params[:id])
    # @novels = @article.novels
    # @novel = Novel.new
    # @novels = @article.novels.includes(:user)
  end

  def edit

  end

  def update
    novel = Novel.find(params[:id])
    novel.update(novel_params)
    redirect_to '/'
  end

  # def count
  #   @count = Novel.all.size
  # end

  private
  def novel_params
    params.require(:novel).permit(:title, :body).merge(user_id: current_user.id, article_id: params[:article_id])
    # params.require(:novel).permit(:user_id, :article_id, :title, :body)
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end

end
