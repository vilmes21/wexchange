class Tag < ApplicationRecord
  has_many :taggings, dependent: :nullify
end
