class Video < ActiveRecord::Base
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, format: YT_LINK_FORMAT
  # before save use yt gem to call Youtube api to get video id, title and published date to be passed on to datebase
  before_save :yt_api_call

  def yt_api_call
    video = Yt::Video.new url: self.link
    self.uid = video.id
    self.title = video.title
    self.published_at = video.published_at
  end
  
end