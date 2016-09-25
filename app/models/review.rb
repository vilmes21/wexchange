class Review < ApplicationRecord
  belongs_to :user

  # validates :body
  # validates :receiver_id
end
