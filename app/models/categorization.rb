class Categorization < ActiveRecord::Base
  validates :book_id, presence: true, uniqueness: {scope: :category_id}
  validates :category_id, presence: true
end
