class Tag < ApplicationRecord
  has_many :taggings, dependent: :nullify
  has_many :wishes, dependent: :nullify
end
