class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments, dependent: :destroy

  #バリデーション
  validates :name,length:{ maximum: 10 }, presence: true
  validates :email, length:{ maximum: 50}, presence: true
  validates :password, presence: true

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


  #　フォローしたときの処理
def follow(user_id)
  followers.create(followered_id: user_id)
end

#　フォローを外すときの処理
def unfollow(user_id)
  followers.find_by(followered_id: user_id).destroy
end

#フォローしていればtrueを返す
def following?(user)
  following_users.include?(user)
end

end
