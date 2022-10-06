require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
  end

  it 'belongs to a user' do
    expect(@recipe.user).to eq(@user)
  end

  it 'has a name' do
    expect(@recipe.name).to eq('Test Recipe')
  end

  it 'destroys the food when the recipe is destroyed' do
    @recipe.destroy
    expect(@recipe.destroyed?).to eq(true)
  end
end
