class LikesController < ApplicationController

  before_action :require_login, only: [:edit, :update]

  def create
    @like = Like.new(user_id: session[:user_id], video_id: params[:id])
    if @like.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

end
