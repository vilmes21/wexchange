class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :user
  has_many :wishes, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :requested_posts, through: :requests, source: :post
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :watches, dependent: :destroy
  has_many :watched_posts, through: :watches, source: :post


  # validates :name, uniqueness: {scope: :email}
  # validates :email
  # validates :phone
end
