class Post < ApplicationRecord
   has_one_attached :image
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end
