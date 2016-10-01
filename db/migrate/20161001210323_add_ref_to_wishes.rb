class AddRefToWishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :wishes, :tag, foreign_key: true
    remove_column :wishes, :tag, :string
  end
end
