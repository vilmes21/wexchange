class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :request, foreign_key: true
      t.string :body
      t.references :user, foreign_key: true
      t.integer :to_user
      t.boolean :read

      t.timestamps
    end
  end
end
