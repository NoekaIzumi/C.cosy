class ChangeColumnDefaultToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts,:budget, from: nil, to: 0, null: false
  end
end
