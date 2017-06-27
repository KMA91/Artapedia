class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :comment
  has_many :likes, as: :like
end
