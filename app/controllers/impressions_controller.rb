class ImpressionsController < ApplicationController
  before_action :set_impression, only: [:show, :edit, :update, :destroy, :index]


  def show
    @article = Article.find_by(id: params[:id])
    @articleImpression = @impression.article
    @articles = @articleImpression.impressions.page(params[:page]).per(1).order("created_at ASC")
  end

  def create
    @impression = Impression.new(impression_params)
    @articleImpression = @impression.article
    if @impression.save
      redirect_to article_path(@articleImpression)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to article_path(@articleImpression)
      flash[:alert] = "投稿に失敗しました"
    end
  end

  # def show
  #   @articleImpression = @impression.article
  #   @articles = @articleImpression.impressions.page(params[:page]).per(1).order("created_at ASC")

    # @article = Article.find_by(id: params[:id])
    # @articleImpression = @impression.article

    # @articles = @articleImpression.impressions.page(params[:page]).per(1).order("created_at ASC")

    # @articleNovel = @novel.article
    # @articles = @articleNovel.novels.page(params[:page]).per(1).order("created_at ASC")
  # end

  private
  def impression_params
    params.require(:impression).permit(:user_id, :article_id, :body, :impression)
  end

  def set_impression
    @impression = Impression.find_by(id: params[:id])
  end
end
