class RenameWorkingReqIdPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :exchanged_post_id, :working_request_id
    add_column :posts, :status, :string
  end
end
