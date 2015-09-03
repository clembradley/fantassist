require "spec_helper"

describe Player do

  describe ".undrafted" do
    it "returns all players who are not associated with a draft pick" do
      expected_players = create_list(:player, 2)
      draft_pick = create(:draft_pick) # will also create a player
      expect(Player.count).to eq(3) # sanity check

      expect(Player.undrafted).to eq(expected_players)
    end
  end

  describe "#full_name" do
    it "returns a player's first and last name" do
      player = Player.new(first_name: "Sterling", last_name: "Archer")

      expect(player.full_name).to eq("Sterling Archer")
    end
  end

  context "validations" do
    subject { build(:player) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:organization) }
    it { is_expected.to ensure_inclusion_of(:position).in_array(Player::POSITIONS) }
    it { is_expected.to ensure_inclusion_of(:organization).in_array(Player::ORGANIZATIONS) }
    it { is_expected.to have_many(:draft_picks).dependent(:destroy) }
    it { is_expected.to have_many(:stats).dependent(:destroy) }
  end
end
