require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should validate that password and the password_confirmation is not matching' do
      @user = User.new({name: "Mark", email: "W@W", password: "12311111", password_confirmation: "11111111"}) 
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
      @user = User.new({name: nil, email: nil, password: "11111111", password_confirmation: "11111111"}) 
      
      expect(@user.save).to be false
    end


    it 'Should have a minimum length when a user account is being created' do
      @user = User.new(name: "Mark", email: "W@W", password: "111", password_confirmation: "111") 
      
      expect(@user.save).to be false
    end
  end



  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'Should authenticated successfully if a visitor types in a few spaces before and/or after their email address' do
      
      @user1 = User.new({name: "Mark", email: "example@domain.com", password: "111111", password_confirmation: "111111"})
      @user1.save

      @authenticated_user = User.authenticate_with_credentials(" example@domain.com ", "111111")
  
      expect(@authenticated_user).to_not eq(nil)
    end


    it 'Should authenticated successfully if a visitor types a wrong case for their email' do
      
      @user1 = User.new({name: "Mark", email: "eXample@domain.COM", password: "111111", password_confirmation: "111111"})
      @user1.save

      @authenticated_user = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "111111")
  
      expect(@authenticated_user).to_not eq(nil)
    end
  end
end
