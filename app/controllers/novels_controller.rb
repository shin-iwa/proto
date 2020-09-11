class NovelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_novel, only: [:show, :edit, :update, :destroy]

  def create
    @novel = Novel.new(novel_params)
    @article = @novel.article
    if @novel.save
      redirect_to edit_article_path(@article)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to edit_post_path(@article)
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    @article = @novel.article
    if @novel.destroy
      redirect_to edit_article_path(@article)
      flash[:notice] = "投稿の削除がされました"
    else
      redirect_to edit_article_path(@article)
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end

  def show
  end

  def edit
    @article = @novel.article
  end

  def update
    if @novel.update(update_novel_params)
      redirect_to article_page_path(@novel)
      flash[:notice] = "投稿が修正されました"
    else
      redirect_to article_page_path(@novel)
      flash[:alert] = "投稿の修正に失敗しました"
    end
  end

  private
  def novel_params
    params.require(:novel).permit(:user_id, :article_id, :title, :body, :novel)
  end

  def update_novel_params
    params.require(:novel).permit(:user_id, :article_id, :title, :body, :novel, id: params[:id])
  end

  def set_novel
    @novel = Novel.find_by(id: params[:id])
  end

end
