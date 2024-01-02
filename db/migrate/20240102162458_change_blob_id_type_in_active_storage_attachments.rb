class ChangeBlobIdTypeInActiveStorageAttachments < ActiveRecord::Migration[7.0]
  def change
    change_column :active_storage_attachments, :blob_id, :bigint
  end
end
