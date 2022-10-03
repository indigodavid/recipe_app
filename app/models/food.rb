class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than: 0 }
end
