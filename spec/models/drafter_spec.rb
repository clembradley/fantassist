require "spec_helper"

describe Drafter do

  describe "#name" do
    it "returns the first and last name of the drafter\'s user" do
      user = build_stubbed(:user, first_name: "Sterling", last_name: "Archer")
      drafter = build_stubbed(:drafter, user: user)

      expect(drafter.name).to eq("Sterling Archer")
    end

    it "returns just the first name if the last name is blank" do
      user = build_stubbed(:user, first_name: "Sterling", last_name: nil)
      drafter = build_stubbed(:drafter, user: user)

      expect(drafter.name).to eq("Sterling")
    end

    it "returns just the last name if the first name is blank" do
      user = build_stubbed(:user, first_name: nil, last_name: "Archer")
      drafter = build_stubbed(:drafter, user: user)

      expect(drafter.name).to eq("Archer")
    end

    it "returns blank string if first and last names are nil" do
      user = build_stubbed(:user, first_name: nil, last_name: nil)
      drafter = build_stubbed(:drafter, user: user)

      expect(drafter.name).to eq("")
    end
  end

  context "validations" do
    subject { build(:drafter) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:league) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to belong_to(:league) }
    it { is_expected.to have_many(:draft_picks).dependent(:destroy) }
  end
end
