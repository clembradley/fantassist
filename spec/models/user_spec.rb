require 'spec_helper'

describe User do
  it 'has many drafters' do
    user = User.create(email: "randyranderson@example.com")
    expected_drafters = [
      Drafter.create(name: "foo", user_id: user.id),
      Drafter.create(name: "bar", user_id: user.id)
    ]

    user.reload
    expect(user.drafters.sort).to eq(expected_drafters.sort)
  end

  specify 'associated drafters get destroyed when a user is destroyed' do
    user = create(:user)
    2.times { create(:drafter, user: user) }
    expect(user.reload.drafters).to_not be_nil

    user.destroy

    expect(Drafter.where(user_id: user.id)).to be_empty
  end

  describe "#email=" do
    it "downcases" do
      user = User.new
      user.email = "STERLINGarcher@example.COM"
      expect(user.email).to eq("sterlingarcher@example.com")
    end

    it "strips whitespace" do
      user = User.new
      user.email = "  chetmanley@example.com  "
      expect(user.email).to eq("chetmanley@example.com")
    end
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('bob@loBlaw.com', 'Bob.lob+Law@lawblog.com', '   george@michael.com ').for(:email) }
    it { should_not allow_value('bob @loB law.com', 'bob@lawblog', 'bob').for(:email) }
  end
end
