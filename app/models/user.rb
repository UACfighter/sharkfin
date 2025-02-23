class User < ApplicationRecord
  belongs_to :role
  has_one :profile
  has_many :posts
  has_many :comments
end
