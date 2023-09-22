class Category < ApplicationRecord
  has_many :book
  validates :name, presence: true, uniqueness: true, length: {minimum:3}
end
