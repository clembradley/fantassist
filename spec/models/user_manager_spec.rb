require 'spec_helper'

describe UserManager do
  describe '.create' do
    it 'creates a and returns a user' do
      user = UserManager.create(email: 'sterling@example.com')

      expected_user = User.find_by(email: 'sterling@example.com')
      expect(expected_user).to be_present
      expect(expected_user).to eq(user)
    end

    it 'creates a drafter associated with the user' do
      user = UserManager.create(email: 'sterling@example.com')

      expect(user.drafters.count).to eq(1)
    end

    it 'returns a user with validation errors if save fails' do
      user = UserManager.create

      expect(user).to be_invalid
      expect(user.errors).to be_present
    end

    it 'does not create a drafter if the user save fails' do
      expect { UserManager.create }.to_not change(Drafter, :count)
    end
  end

  describe '.first_or_create_by' do
    it 'returns a user from given attributes if the user exists' do
      user = create(:user)

      expect(UserManager.first_or_create_by(email: user.email)).to eq(user)
    end

    it 'creates a new user with the given attrs if the user does not exist' do
      attrs = {email: 'sterling@example.com', first_name: 'Sterling'}

      UserManager.first_or_create_by(attrs)

      user = User.find_by(attrs)
      expect(user).to be_present
    end

    it 'takes an optional block to set attributes on the user if creating a new user' do
      attrs = {email: 'sterling@example.com'}

      UserManager.first_or_create_by(attrs) do |user|
        user.first_name = 'Sterling'
        user.last_name = 'Archer'
      end

      user = User.find_by(attrs)
      expect(user).to be_present
      expect(user.first_name).to eq('Sterling')
      expect(user.last_name).to eq('Archer')
    end

    it 'creates an associated drafter to the user when creating a new user' do
      attrs = {email: 'sterling@example.com', first_name: 'Sterling'}

      user = UserManager.first_or_create_by(attrs)

      expect(user.drafters.count).to eq(1)
    end
  end
end
