require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
      group = Category.new(
        name: 'Grocery Shopping',
        icon: 'https://example.com/icon.png',
        user:
      )
      expect(group).to be_valid
    end
  end


  it 'is invalid without a name' do
    group = Category.new(
      icon: 'https://example.com/icon.png'
    )
    expect(group).to_not be_valid
  end

  it 'is invalid without an icon' do
    group = Category.new(
      name: 'Grocery Shopping'
    )
    expect(group).to_not be_valid
  end


  describe '#total_amount' do
    it 'returns the sum of record amounts for the group' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
      group = Category.create(name: 'Grocery Shopping', icon: 'https://example.com/icon.png', user:)

      # Create some records associated with the group
      record1 = Payment.create(name: 'Milk', amount: 2.5, author: user)
      record2 = Payment.create(name: 'Bread', amount: 3.0, author: user)

      # Associate the records with the group
      group.payments << record1
      group.payments << record2

      # Calculate the total amount
      total_amount = record1.amount + record2.amount

      expect(group.total_amount).to eq(total_amount)
    end
  end
end
