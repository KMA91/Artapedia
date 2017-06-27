class Like < ActiveRecord::Base
  belongs_to :like, polymorphic: true
end
