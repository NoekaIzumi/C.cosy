class ChangePostIdTypeInFavorites < ActiveRecord::Migration[7.0]
  def up
    change_column :favorites, :post_id, :bigint
  end

  def down
    # rollback時の処理。必要な場合に実装してください。
    raise ActiveRecord::IrreversibleMigration
  end

end
