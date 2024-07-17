class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  #コメントのバリデーション
  validates :comment, presence: true,length:  {maximum: 100 }

end
