class NovelsController < ApplicationController
  before_action :set_novel, only: [:edit, :show,]
  # def new
  #   @tweet = Tweet.new
  # end

  def create
    Novel.create(novel_params)
    redirect_to '/'
  end

  def show
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

  def count
    @count = Novel.all.size
  end

  private
  def novel_params
    params.require(:novel).permit(:title, :body).merge(user_id: current_user.id, article_id: params[:article_id])
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end

end