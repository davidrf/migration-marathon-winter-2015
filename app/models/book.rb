class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  # validates :rating, numericality: {minimum: 0, maximum: 100}
  has_many :checkouts
end
