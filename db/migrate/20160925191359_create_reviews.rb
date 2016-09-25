class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.string :receiver_id

      t.timestamps
    end
  end
end
