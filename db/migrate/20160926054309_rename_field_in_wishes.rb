class RenameFieldInWishes < ActiveRecord::Migration[5.0]
  def change
    rename_column :wishes, :category, :tag
  end
end
