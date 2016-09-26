class RemoveColumnFromPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :category, :string
    remove_foreign_key :posts, :categories
  end
end
