class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.references :user, foreign_key: true,   null: false
      t.references :tag,  foreign_key: true,   null: false

      t.string  :user_name,                         null: false, default: ""
      t.string  :restaurant_name,                   null: false, default: ""
      t.integer :budget,                            null: false, default: ""
      t.string  :closest,                           null: false, default: ""
      t.integer :distance,                          null: false, default: ""

      t.timestamps
    end
  end
end
