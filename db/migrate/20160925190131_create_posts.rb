class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :category
      t.integer :value
      t.references :user, foreign_key: true
      t.string :location
      t.string :exchanged_post_id
      t.integer :duration
      t.time :time

      t.timestamps
    end
  end
end
