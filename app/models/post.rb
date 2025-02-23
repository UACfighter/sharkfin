class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :status, optional: true
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end
