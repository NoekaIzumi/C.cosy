class Post < ApplicationRecord
   has_one_attached :image
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

   with_options if: :draft? do
    validates :restaurant_name,length:{ maximum: 50 }
    validates :budget, length: { maximum: 10 }
    validates :closest, length: { maximum: 50}
    validates :distance, length:{ maximum: 100}
   end

  with_options if: :published? do
    validates :restaurant_name,length:{ minimum: 3, maximum: 50 }
    validates :budget, length: { minimum: 3, maximum: 10 }
    validates :closest, length: { minimum: 1, maximum: 50}
    validates :distance, length:{ minimum: 5, maximum: 100}
  end



  def favorite?(user)
   favorites.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  enum status: { published: 0, draft: 1 }

end
