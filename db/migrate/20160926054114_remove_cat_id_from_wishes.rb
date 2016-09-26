class RemoveCatIdFromWishes < ActiveRecord::Migration[5.0]
  def change
    add_column :wishes, :category, :string
    remove_foreign_key :wishes, :categories
  end
end
