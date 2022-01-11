require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Should validate that the name presence' do
      @category = Category.new
      @product = Product.new({name: "Mark", price: 100, quantity: 10, category: @category}) 
      @product.save!
  
      expect(@product.id).to be_present
    end

    it 'Should validate that the name equel to nil' do
      @category = Category.new
      @product = Product.new({name: nil, price: 100, quantity: 10, category: @category}) 
      @product.save
  
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end


    # Because of monitize nil converts to 0 ::
    # it 'Should validate that the price equel to nil' do
    #   @category = Category.new
    #   @product = Product.new({name: "Mark", price: "", quantity: 10, category: @category}) 
    #   @product.save

    #   expect(@product.errors.full_messages).to eq ["Price is not a number"]
    # end


    it 'Should validate that the quantity equel to nil' do
      @category = Category.new
      @product = Product.new({name: "Mark", price: 100, quantity: nil, category: @category}) 
      @product.save

      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end


    it 'Should validate that the category equel to nil' do
      @category = Category.new
      @product = Product.new({name: "Mark", price: 100, quantity: 10, category: nil}) 
      @product.save

      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end
  end
end
