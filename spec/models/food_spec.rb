require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user = User.create(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    Food.new(name: 'Injera', measurement_unit: 'kg', price: '123', user:)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be equal to or greater that 1' do
    subject.price = 1
    expect(subject).to be_valid
  end
end
