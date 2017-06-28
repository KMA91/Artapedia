class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to :back
    else
      redirect_to 'fdksjfjkdsl'
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  def index
    @uploads = Upload.all
  end

  private
    def upload_params
      params.require(:upload).permit(:name, :description, :file)
    end
end
