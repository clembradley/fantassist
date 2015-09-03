require "spec_helper"

describe User do

  describe "#email=" do
    it "downcases" do
      user = User.new(email: "STERLINGarcher@example.COM")
      expect(user.email).to eq("sterlingarcher@example.com")
    end

    it "strips whitespace" do
      user = User.new(email: "  chetmanley@example.com  ")
      expect(user.email).to eq("chetmanley@example.com")
    end
  end

  context "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value("bob@loBlaw.com", "Bob.lob+Law@lawblog.com", "   george@michael.com ").for(:email) }
    it { is_expected.not_to allow_value("bob @loB law.com", "bob@lawblog", "bob").for(:email) }
    it { is_expected.to have_many(:drafters).dependent(:destroy) }
  end
end
