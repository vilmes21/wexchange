class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :wishes, dependent: :nullify
end
