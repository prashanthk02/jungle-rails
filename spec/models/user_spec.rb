require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    let(:user) {User.new(first_name: 'abc', last_name:'cd', email:'abc.com', password: 'aaa', password_confirmation: 'aaa')}

    it 'should be a valid user' do
      expect(user).to be_valid
    end

    it 'should have a valid first name' do
      user.first_name = nil
      expect(user).to be_invalid
    end

    it 'should have a valid last name' do
      user.last_name = nil
      expect(user).to be_invalid
    end

    it 'should have a valid email' do
      user.email = nil
      expect(user).to be_invalid
    end

    it 'should have a password of min 3 chars' do
      user.password = 'a'
      expect(user).to be_invalid
    end

    it 'passwords should not match' do
      user.password = 'aaa'
      user.password_confirmation = 'aas'
      expect(user).to be_invalid
    end

    it 'passwords should match' do
      user.password = 'aaa'
      user.password_confirmation = 'aaa'
      expect(user).to be_valid
    end

    it 'should have a unique email' do
      @user1 = User.new(first_name: 'Pr', last_name: 'kp', email: 'pr@kp.com', password: 'abc', password_confirmation: 'abc')
      @user1.save!
      @user2 = User.new(first_name: 'Pr', last_name: 'kp', email: 'PR@kp.com', password: 'abc', password_confirmation: 'abc')
      expect(@user2).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do
    let(:user) {User.new(first_name: 'abc', last_name:'cd', email:'abcz.com', password: 'aaa', password_confirmation: 'aaa')}
    
    before(:each) do
      user.save!
    end

    it 'should not return nil when credentials are correct' do
      @new_session = User.authenticate_with_credentials('abcz.com', 'aaa')
      expect(@new_session).not_to be_nil
    end

    it 'should  return nil when email is incorrect' do
      @new_session = User.authenticate_with_credentials('abczx.com', 'aaa')
      expect(@new_session).to be_nil
    end

    it 'should return nil when password is correct' do
      @new_session = User.authenticate_with_credentials('abcz.com', 'aaas')
      expect(@new_session).to be_nil
    end

    it 'should not return nil when email has trailspaces' do
      @new_session = User.authenticate_with_credentials('  abcz.com  ', 'aaa')
      expect(@new_session).not_to be_nil
    end

    it 'should not return nil when email has different cases' do
      @new_session = User.authenticate_with_credentials('abCZ.com', 'aaa')
      expect(@new_session).not_to be_nil
    end

  end

end
