class CreatePostTags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tags do |t|

       t.bigint :post, foreign_key: true,   null: false
       t.bigint :tag,  foreign_key: true,   null: false

      t.timestamps
    end
  end
end
