class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments, dependent: :destroy

##フォロー機能
  # フォローをした、されたの関係
has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :followereds, class_name: "Relationship", foreign_key: "followered_id", dependent: :destroy

# 一覧画面で使う
has_many :following_users, through: :followers, source: :followered
has_many :follower_users, through: :followereds, source: :follower


  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def favorited?(post)
    post.favorites.exists?(user_id: self.id)
  end

end
