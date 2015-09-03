require 'spec_helper'

describe Player do

  describe 'associations' do
    let(:player) { create(:player) }

    it 'can have a draft pick' do
      expected_draft_pick = create(:draft_pick, player: player)

      expect(player.draft_pick).to eq(expected_draft_pick)
    end

    it 'has many stats' do
      expected_stats = create_list(:stat, 2, player: player)

      expect(player.stats).to match_array(expected_stats)
    end

    specify 'associated draft pick get destroyed when a player is destroyed' do
      create(:draft_pick, player: player)
      expect(player.draft_pick).to be_present

      player.destroy

      expect(DraftPick.where(player_id: player.id)).to be_blank
    end

    specify 'associated stats get destroyed when a player is destroyed' do
      create_list(:stat, 2, player: player)
      expect(player.stats).to be_present

      player.destroy

      expect(Stat.where(player_id: player.id)).to be_blank
    end
  end

  describe '.undrafted' do
    it 'returns all players who are not associated with a draft pick' do
      expected_players = create_list(:player, 2)
      draft_pick = create(:draft_pick) # will also create a player
      expect(Player.count).to eq(3) # sanity check

      expect(Player.undrafted).to eq(expected_players)
    end
  end

  describe '#full_name' do
    it 'returns a player\'s first and last name' do
      player = Player.new(first_name: 'Sterling', last_name: 'Archer')

      expect(player.full_name).to eq('Sterling Archer')
    end
  end

  context 'validations' do
    subject { build(:player) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:organization) }
    it { is_expected.to ensure_inclusion_of(:position).in_array(Player::POSITIONS) }
    it { is_expected.to ensure_inclusion_of(:organization).in_array(Player::ORGANIZATIONS) }
  end
end
