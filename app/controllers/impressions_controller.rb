class ImpressionsController < ApplicationController
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

  private
  def impression_params
    params.require(:impression).permit(:user_id, :article_id, :body, :impression)
  end

end
