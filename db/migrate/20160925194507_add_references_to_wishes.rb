class AddReferencesToWishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :wishes, :category, foreign_key: true
  end
end
