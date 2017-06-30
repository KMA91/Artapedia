class Comment < ActiveRecord::Base
  belongs_to :comment, polymorphic: true
  belongs_to :user
  validates :content, presence: true
end
