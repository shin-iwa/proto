class NovelsController < ApplicationController
  before_action :set_novel, only: [:edit, :show,]
  before_action :authenticate_user!
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

  # def create
  #   Novel.create(novel_params)
  #   redirect_to '/'
  # end

  def create
    @novel = Novel.new(novel_params)
    @article = @novel.article
    @novel.save

    # if @novel.save
    #   respond_to :js
    # else
    #   flash[:alert] = "コメントに失敗しました"
    # end
  end

  def show

    @novel = Novel.find(params[:id])

  end

  def edit

  end

  def update
    novel = Novel.find(params[:id])
    novel.update(novel_params)
    redirect_to '/'
  end

  # def destroy
  #   novel = Novel.find(params[:id])
  #   novel.destroy
  #   redirect_to '/'
  # end

  def destroy
    @novel = Novel.find_by(id: params[:id])
    @article = @novel.post
    @comment.destroy

    # if @comment.destroy
    #   respond_to :js
    # else
    #   flash[:alert] = "コメントの削除に失敗しました"
    # end
  end



  # def count
  #   @count = Novel.all.size
  # end

  private
  def novel_params
    # params.require(:novel).permit(:title, :body).merge(user_id: current_user.id, article_id, :novel)
    
    params.require(:novel).permit(:title, :body).merge(user_id: current_user.id, article_id: params[:article_id])

    # params.require(:novel).permit(:user_id, :article_id, :title, :body)
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end

end
