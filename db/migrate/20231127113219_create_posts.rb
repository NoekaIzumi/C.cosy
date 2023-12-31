class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.references :user, foreign_key: true,   null: false
      t.string  :restaurant_name,                   null: false, default: ""
      t.integer :budget,                            default: 0
      t.string  :closest,                           null: false, default: ""
      t.string :distance,                          null: false, default: ""
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
