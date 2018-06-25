require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user1 = User.new(name: 'James', email: 'james@gmail.com', password: 'james123', password_confirmation: 'james123')
      expect(user1).to be_valid
      end
    it 'is not valid without a first name' do
      user1 = User.new(name: nil , email: 'james@gmail.com', password: 'james123', password_confirmation: 'james123')
      expect(user1).to_not be_valid
    end
    it 'is not valid without a email' do
      user1 = User.new(name: 'James', email: nil, password: 'james123', password_confirmation: 'james123')
      expect(user1).to_not be_valid
    end
    it ' is not valid without a password' do
      user1 = User.new(name: 'James', email: 'james@gmail.com', password: nil, password_confirmation: nil)
      expect(user1).to_not be_valid
    end    
    it ' is not valid without matching passwords' do
      user1 = User.new(name: 'James', email: 'james@gmail.com', password: 'james123', password_confirmation: 'jam123')
      expect(user1).to_not be_valid
    end
    it ' is not valid without an unique email' do
      User.create(name: 'james1', email: 'JAMES@GMAIL.COM', password: 'james1', password_confirmation: 'james1') 
      user1 = User.new(name: 'james2', email: 'james@gmail.com', password: 'james2', password_confirmation: 'james2')
      expect(user1).to_not be_valid
    end
    it 'is not valid with a short password (< 6 characters)' do
      user1 = User.new(name: 'James', email: 'james@gmail.com', password: 'james', password_confirmation: 'james')
      expect(user1).to_not be_valid
    end
    end

    describe '.authenticate_with_credentials' do
    it 'return nil if without correct password' do
      user1 = User.create(name: 'Kelly', email: 'kelly@gmail.com', password: 'kelly123', password_confirmation: 'kelly123')
      user1_login = User.authenticate_with_credentials(user1.email, user1.password)
      expect(user1_login).to_not be_valid
      end

  end
end