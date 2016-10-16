class Watch < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true, uniqueness: {scope: :post_id, message: 'Already watched.'}
end
