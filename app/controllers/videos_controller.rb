class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    puts @video
    puts "**********************************"
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to '/videos'
    else
      render :new
    end
  end
  def show
    @video = Video.find(params[:id])
    @comments = Comment.all
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end