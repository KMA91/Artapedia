class Video < ActiveRecord::Base
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  # validates :link, format: YT_LINK_FORMAT
  # uploads
  belongs_to :user
  has_many :comments, as: :comment
  has_many :likes, as: :like
  has_attached_file :file, styles: {
      :medium => {
        :geometry => "640x480",
        :format => 'mp4'
      },
      :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
  }, :processors => [:transcoder],
  :storage => :s3,
  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }


  validates :link, presence: true, format: YT_LINK_FORMAT
  # before save use yt gem to call Youtube api to get video id, title and published date to be passed on to datebase
  before_save :yt_api_call

  validates_attachment_content_type :file, content_type: /\Avideo\/.*\Z/

  def s3_credentials
  {:bucket => "ruby-artapedia", :access_key_id => "AKIAILNNEFILNJUDYSCQ", :secret_access_key => "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"}
  end


  def yt_api_call
    video = Yt::Video.new url: self.link
    self.uid = video.id
    self.title = video.title
    self.published_at = video.published_at
  end
end
