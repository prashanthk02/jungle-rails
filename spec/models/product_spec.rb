require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have an id' do
      @category = Category.new(name: "abc")
      @category.save!
      @product = Product.new(name: 'xyz', price: 9, quantity: 99, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should not save without a valid name' do
      @category = Category.new(name: "abc")
      @category.save!
      @product = Product.new(name: nil, price: 9, quantity: 99, category: @category)
      @product.validate
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'should not save without valid price' do
      @category = Category.new(name: "abc")
      @category.save!
      @product = Product.new(name: 'xyz', price: 'nil', quantity: 99, category: @category)
      @product.validate
      expect(@product.errors[:price]).to include("is not a number")
    end

    it 'should not save without valid quantity' do
      @category = Category.new(name: "abc")
      @category.save!
      @product = Product.new(name: 'xyz', price: 9, quantity: nil, category: @category)
      @product.validate
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'should not save without a valid category' do
      @category = Category.new(name: "abc")
      @category.save!
      @product = Product.new(name: 'xyz', price: 9, quantity: 99, category: nil)
      @product.validate
      expect(@product.errors[:category]).to include("can't be blank")
    end

  end
end
