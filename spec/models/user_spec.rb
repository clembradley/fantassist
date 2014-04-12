require 'spec_helper'

describe User do
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
