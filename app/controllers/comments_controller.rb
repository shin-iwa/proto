class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/tweets/#{@comment.tweet.id}" 
      flash[:notice] = "コメントが保存されました"
    else
      redirect_to "/tweets/#{@comment.tweet.id}" 
      flash[:alert] = "コメントに失敗しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
