class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @comment = current_user.comments.build comment_params

    if @comment.save
      flash[:success] = t ".commented"
    else
      flash[:danger] = t ".can't_comment"
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit :content, :product_id
  end
end
