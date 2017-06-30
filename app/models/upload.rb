class Upload < ActiveRecord::Base
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

  validates_attachment_content_type :file, content_type: /\Avideo\/.*\Z/

  def s3_credentials
  {:bucket => "ruby-artapedia", :access_key_id => "AKIAJX7UVVMD7F53LVOQ", :secret_access_key => "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"}
  end
end
