class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :password, presence: true
  validates :real_name, presence: true
end
