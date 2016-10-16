class CancelStiInPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :category, :string
    remove_column :posts, :type, :string
  end
end
