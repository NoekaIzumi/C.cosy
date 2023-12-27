class Relationship < ApplicationRecord
  belongs_to :follower,class_name: "User"
  belongs_to :followered,class_name: "User"

  #　フォローしたときの処理
def follow(user_id)
  raise
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
