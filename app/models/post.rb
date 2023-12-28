class Post < ApplicationRecord
   has_one_attached :image
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :restaurant_name, presence: true
  validates :budget, presence: true
  validates :closest, presence: true
  validates :distance, presence: true

  def favorite?(user)
   favorites.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  validate :content_presence

  def content_presence
    # コンテンツ以外の属性が全て空の場合、エラーを追加します
    if restaurant_name.blank? && budget.blank? && closest.blank? && distance.blank?
      errors.add(:base, "お店の名前、予算、最寄り駅、距離を入力してください。")
    end
  end


  enum status: { published: 0, draft: 1 }

end
