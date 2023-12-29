class ChangeColumnToNotNull < ActiveRecord::Migration[7.0]
  def up
    change_column :posts, :restaurant_name,:string, null: true
    change_column :posts, :budget,:integer, null: true
    change_column :posts, :closest,:string, null: true
    change_column :posts, :distance,:string, null: true
  end

  def down
    change_column :posts, :name,:string,null: false
    change_column :posts, :budget,:integer,null: false
    change_column :posts, :closest,:string,null: false
    change_column :posts, :distance,:string,null: false
  end
end
