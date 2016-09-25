class AddReferencesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :category, foreign_key: true
    remove_column :posts, :category, :string
  end
end
