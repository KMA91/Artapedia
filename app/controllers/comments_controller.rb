class CommentsController < ApplicationController

  before_action :require_login

  def create
  	@comment = Comment.new(comment_params)
  	unless @comment.save
  		flash[:errors] =@comment.errors.full_messages
  	end
  	@comment.user_id = session[:user_id]
  	@comment.save
  	redirect_to :back
  end

  def destroy
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
