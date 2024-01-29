#以下初期データ

Admin.find_or_create_by!([
  { email: 'noeka.izumi@outlock.jp',
    password: 'admin123' }
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tags_data = [
  { name: '女子会' },
  { name: 'サプライズ' },
  { name: 'ランチ' },
  { name: 'ディナー' },
  { name: 'ソファー席あり' },
  { name: '個室あり' }
]

tags_data.each do |tag_params|
  Tag.find_or_create_by!(tag_params)
end