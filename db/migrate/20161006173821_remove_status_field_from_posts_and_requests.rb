class RemoveStatusFieldFromPostsAndRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :status, :string
    remove_column :requests, :status, :string
  end
end
