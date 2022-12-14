class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/pics/#{comment.pic.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, pic_id: params[:pic_id])
  end
end
