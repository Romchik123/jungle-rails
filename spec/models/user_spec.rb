require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should validate that password and the password_confirmation is not matching' do
      @user = User.new({name: "Mark", email: "W@W", password: "123", password_confirmation: "111"}) 
      @user.save
  
      expect(@user.id).to be_nil
    end


    it 'Should have password and password confirmation' do
      @user = User.new({name: "Mark", email: "W@W", password: nil, password_confirmation: nil}) 
      @user.save
  
      expect(@user.id).to be_nil
    end


    it 'Should check if this email is unique' do
      @user1 = User.new({name: "Mark", email: "w@w.com", password: "111111", password_confirmation: "111111"})
      @user1.save

      @user2 = User.new({name: "Greg", email: "W@W.com", password: "111111", password_confirmation: "111111"}) 
      @user2.save
  
      expect(User.all.count).to eq(1)
      expect(@user2.id).to be_nil
    end


    it 'Should require name and Email' do
      @user = User.new({name: nil, email: nil, password: "111", password_confirmation: "111"}) 
      
      expect(@user.save).to be false
    end
  end
end
