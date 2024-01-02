class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|

      t.bigint :follower,   foreign_key: {to_table: "users"},   null: false
      t.bigint :followered, foreign_key: {to_table: "users"},   null: false
      t.timestamps

      t.index [:follower_id, :followered_id], unique: true
    end
  end
end
