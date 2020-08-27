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

  private
  def novel_params
    params.require(:novel).permit(:title, :body).merge(user_id: current_user.id, article_id: params[:article_id])
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end

end
