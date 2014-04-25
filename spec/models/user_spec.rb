require 'spec_helper'

describe User do

  let(:user) { create(:user) }

  describe 'associations' do
    it 'has many drafters' do
      expected_drafters = create_list(:drafter, 2, user: user)

      expect(user.drafters.sort).to eq(expected_drafters.sort)
    end

    specify 'associated drafters get destroyed when a user is destroyed' do
      create_list(:drafter, 2, user: user)
      expect(user.drafters).to be_present

      user.destroy

      expect(Drafter.where(user_id: user.id)).to be_blank
    end
  end

  describe "#email=" do
    it "downcases" do
      user.email = "STERLINGarcher@example.COM"
      expect(user.email).to eq("sterlingarcher@example.com")
    end

    it "strips whitespace" do
      user.email = "  chetmanley@example.com  "
      expect(user.email).to eq("chetmanley@example.com")
    end
  end

  context 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('bob@loBlaw.com', 'Bob.lob+Law@lawblog.com', '   george@michael.com ').for(:email) }
    it { should_not allow_value('bob @loB law.com', 'bob@lawblog', 'bob').for(:email) }
  end
end
