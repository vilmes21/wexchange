class RenameCatTypeInPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :category, :string
    add_column :posts, :type, :string
  end
end
