class Comment < ActiveRecord::Base
  belongs_to :comment, polymorphic: true
  validates :content, presence: true
end
