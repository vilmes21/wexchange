class RemoveAndAddOfferidRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :offer, :string
    add_column :requests, :offer_id, :integer
  end
end
