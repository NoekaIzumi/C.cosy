class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def favorited?(post)
    post.favorites.exists?(user_id: self.id)
  end

end
