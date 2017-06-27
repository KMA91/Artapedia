class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  validates :password, :password_confirmation, presence: true, on: :create
  # , length: { in: 8..20 }
  validates :name, :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_many :comments, as: :comment
  has_many :likes, as: :like
  has_many :uploads
end
