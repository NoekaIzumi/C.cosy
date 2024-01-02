class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|

      t.bigint :user, foreign_key: true,   null: false
      t.bigint :post, foreign_key: true,   null: false

      t.timestamps
    end
  end
end
