class VideosController < ApplicationController
  # renders homepage with videos
  def index
    @videos = Video.order('created_at DESC')
  end
  # renders video creation page
  def new
    @video = Video.new
  end
  # creates video using Youtube api
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
    params.require(:video).permit(:link, :title, :file)
  end
end
