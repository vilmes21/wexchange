class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :watches, dependent: :destroy


  # validates :title
  # validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validates :location
end
