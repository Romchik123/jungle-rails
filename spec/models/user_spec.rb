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


    # To comeback to this one later
    # it 'Should check if this email is unique' do
    #   @user1 = User.create({name: "Mark", email: "w@w.com", password: "111", password_confirmation: "111"})
    #   @user1.save

    #   @user2 = User.create({name: "Greg", email: "W@W.com", password: "111", password_confirmation: "111"}) 
    #   @user2.save
  
    #   expect(@user2.id).to be_nil
    # end


    # To comeback to this one later
    it 'Should require name and Email' do
      @user = User.create({name: nil, email: nil, password: "111", password_confirmation: "111"}) 
  
      expect(@user.save).to be false
    end
  end
end
