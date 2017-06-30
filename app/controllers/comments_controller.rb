class CommentsController < ApplicationController

  before_action :require_login

  def create
  	@comment = Comment.new(comment_params)
  	@comment.user = curr_user
  	if @comment.save
  	  redirect_to :back 
    else
      flash[:errors] =@comment.errors.full_messages
  	end
  end

  def destroy
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
