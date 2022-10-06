require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @food = Food.new(name: 'Test Food', measurement_unit: 'kilo', price: 10, user: @user)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'measurement_unit should be present' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'price should be equal to or greater that 1' do
    @food.price = 1
    expect(@food).to be_valid
  end
end
