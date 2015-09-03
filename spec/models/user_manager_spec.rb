require 'spec_helper'

describe UserManager do
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

    it "creates a default league when creating the user" do
      attrs = {email: 'sterling@example.com', first_name: 'Sterling'}

      user = UserManager.first_or_create_by(attrs)

      league = user.leagues.first
      expect(league).to be_present
      expect(league.name).to eq("Sterling's default league")
    end
  end
end
