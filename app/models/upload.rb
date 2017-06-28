class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :comment
  has_many :likes, as: :like
  has_attached_file :file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  # validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
  {:bucket => "ruby-artapedia", :access_key_id => "AKIAJ7UXVJLSZ4INCRVQ", :secret_access_key => "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"}
  end

end
