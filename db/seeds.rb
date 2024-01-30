#以下初期データ

Admin.find_or_create_by!(
  email: "noeka.izumi@outlock.jp"
) do |admin|
  admin.password = "admin123"

unless admin.save
    puts "Error message: #{admin.errors.full_messages.join(', ')}"
    raise ActiveRecord::RecordInvalid.new(admin)
end

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Tag.find_or_create_by(name: '女子会')
Tag.find_or_create_by(name: 'サプライズ')
Tag.find_or_create_by(name: 'ランチ')
Tag.find_or_create_by(name: 'ディナー')
Tag.find_or_create_by(name: 'ソファー席あり')
Tag.find_or_create_by(name: '個室あり')

#以下テストデータ

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "444444"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "555555"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.jpg")
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "666666"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.jpg")
end

#以下テストデータ

Post.find_or_create_by!(restaurant_name: "Cavello") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.budget = 1000
  post.closest = "表参道"
  post.distance = "Ａ１出口から徒歩5分"
   # タグを取得して関連付ける
  post.tags << Tag.where(name: ['ランチ', '女子会', 'ソファー席あり'])
  post.status = 0
  post.user = olivia
  unless post.save
    puts "Error message: #{post.errors.full_messages.join(', ')}"
    raise ActiveRecord::RecordInvalid.new(post)
  end

  comment = post.comments.build(comment: "大人気のカフェです",user_id: 1,post_id: 1)
  comment.save!

end

Post.find_or_create_by!(restaurant_name: "和食屋せん") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.budget = 3000
  post.closest = "日本橋"
  post.distance = "B1出口から徒歩10分"
  post.tags << Tag.where(name: ['ディナー', '個室あり'])
  post.user = james
  post.status = 0


  unless post.save
    puts "Error message: #{post.errors.full_messages.join(', ')}"
    raise ActiveRecord::RecordInvalid.new(post)
  end

  comment = post.comments.build(comment: "日本料理は美しい！",user_id: 2,post_id: 2)
  comment.save!

end

Post.find_or_create_by!(restaurant_name: "ShoreditchBar") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.budget = 2000
  post.closest = "池袋"
  post.distance = "JR東口から徒歩5分"
  post.tags << Tag.where(name: ['サプライズ','女子会', 'ランチ', 'ディナー','ソファー席あり'])
  post.user = lucas
  post.status = 0

  unless post.save
    puts "Error message: #{post.errors.full_messages.join(', ')}"
    raise ActiveRecord::RecordInvalid.new(post)
  end


  comment = post.comments.build(comment: "メキシコ料理好きな方にオススメ！",user_id: 3,post_id: 3)
  comment.save!

end


