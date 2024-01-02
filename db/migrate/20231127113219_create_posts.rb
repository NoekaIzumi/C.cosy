class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.bigint :user, foreign_key: true,   null: false
      t.string  :restaurant_name,                   null: false, default: ""
      t.integer :budget,                            default: 0
      t.string  :closest,                           null: false, default: ""
      t.string :distance,                          null: false, default: ""

      t.timestamps
    end
  end
end
