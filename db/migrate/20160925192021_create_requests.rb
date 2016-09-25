class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :message
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :offer

      t.timestamps
    end
  end
end
