class RecipeFood < ApplicationRecord
  attr_accessor :quantity_needed, :cost_required

  belongs_to :recipe
  belongs_to :food
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def process_quantity(user_food)
    return @quantity_needed = quantity unless user_food

    diff = user_food.quantity - quantity
    @quantity_needed = diff.negative? ? -diff : 0
  end

  def process_cost(user_food)
    @cost_required = (process_quantity(user_food) * food.price).round(2)
  end
end
