class UnlikesController < ApplicationController

  def create
    @unlike = Unlike.new(user_id: session[:user_id], video_id: params[:id])
    if @unlike.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

end
