class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :watches, dependent: :destroy


  # validates :title
  # validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validates :location

  def watch_of(user)
    watches.find_by_user_id user
  end

  def watched_by?(user)
    watch_of(user).present?
  end

  def like_of(user)
    likes.find_by_user_id user
  end

  def liked_by?(user)
    like_of(user).present?
  end

  # def self.search(x)
  #   where("title ILIKE ?", "%#{x}%") ||
  #   where("description ILIKE ?", "%#{x}%") ||
  #   where("category ILIKE ?", "%#{x}%")
  # end
  def self.search(words)
    scope = Post.all
    words.gsub(",", " ").squeeze(" ").split(" ").each do |word|
      scope = scope.where("title ILIKE :word OR description ILIKE :word OR category ILIKE :word", word: "%#{word}%")
    end
    scope
  end
end
