class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def quantity_needed(user_food)
    return quantity unless user_food

    diff = user_food.quantity - food.quantity
    diff.negative? ? -diff : 0
  end

  def cost_required(user_food)
    (quantity_needed(user_food) * food.price).round(2)
  end
end
