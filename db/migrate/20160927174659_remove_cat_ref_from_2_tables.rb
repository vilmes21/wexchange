class RemoveCatRefFrom2Tables < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :category_id, :integer
    remove_column :wishes, :category_id, :integer
  end
end
