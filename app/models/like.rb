class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validates :user_id, uniqueness: {scope: :post_id, message: 'Already liked'}
end
