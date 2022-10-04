class Recipe < ApplicationRecord
  belongs_to :user

  # has_rich_text :description

  validates :name, :preparation_time, :description, presence: true

end
