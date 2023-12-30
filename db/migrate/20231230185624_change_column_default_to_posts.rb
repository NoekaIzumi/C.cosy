class ChangeColumnDefaultToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts,:budget, nil
  end
end
