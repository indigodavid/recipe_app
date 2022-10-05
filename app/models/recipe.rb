class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  # has_rich_text :description

  validates :name, :preparation_time, :description, presence: true

  def total_cost
    total = 0
    recipe_foods.each do |recipe_food|
      total += recipe_food.quantity * recipe_food.food.price
    end
    total.round(2)
  end
end
