class Request < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # validates :title
end
