class AddToUserFieldToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :to_user, :integer
  end
end
