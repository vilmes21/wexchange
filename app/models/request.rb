class Request < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :pending, :initial => true
    state :accepted, :declined, :cancelled, :completed

    event :accept do
      transitions :from => :pending, :to => :accepted
    end

    event :decline do
      transitions :from => :pending, :to => :declined
    end

    event :cancel do
      transitions :from => :pending, :to => :cancelled
    end

    event :complete do
      transitions :from => :accepted, :to => :completed
    end


  end

  belongs_to :post
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: :true
end
