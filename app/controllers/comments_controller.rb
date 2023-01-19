class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to root_path
  end

  def destroy
    Comment.find_by(id: params[:id],plan_id: params[:plan_id]).destroy
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, plan_id: params[:plan_id])
  end
end
