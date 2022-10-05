require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.new(name: 'Recipe-1', preparation_time: 1, cooking_time: 1, description: 'Testy', public: true,
                         user: @user)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'preparation_time should be present' do
    @recipe.preparation_time = -1
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be equal to or greater than 1' do
    @recipe.cooking_time = 0
    expect(@recipe).to_not be_valid
  end

  it 'description should be present' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end
end
