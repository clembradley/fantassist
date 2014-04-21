require 'spec_helper'

describe Player do

  it 'can have a draft pick' do
    player = create(:player)
    expected_draft_pick = create(:draft_pick, player: player)

    expect(player.reload.draft_pick).to eq(expected_draft_pick)
  end

  it 'has many stats' do
    player = create(:player)
    expected_stats = [create(:stat, player: player), create(:stat, player: player)]

    expect(player.reload.stats.sort).to eq(expected_stats.sort)
  end

  specify 'associated draft pick get destroyed when a player is destroyed' do
    player = create(:player)
    expected_draft_pick = create(:draft_pick, player: player)
    expect(player.reload.draft_pick).to_not be_nil

    player.destroy

    expect(DraftPick.where(player_id: player.id)).to be_empty
  end

  specify 'associated stats get destroyed when a player is destroyed' do
    player = create(:player)
    2.times { create(:stat, player: player) }
    expect(player.reload.stats).to_not be_nil

    player.destroy

    expect(Stat.where(player_id: player.id)).to be_empty
  end

  describe '.undrafted' do
    it 'returns all players who are not associated with a draft pick' do
      expected_players = create_list(:player, 2)
      draft_pick = create(:draft_pick) # will also create a player
      expect(Player.count).to eq(3) # sanity check

      expect(Player.undrafted).to eq(expected_players)
    end
  end

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:organization) }
    it { should ensure_inclusion_of(:position).in_array(Player::POSITIONS) }
    it { should ensure_inclusion_of(:organization).in_array(Player::ORGANIZATIONS) }
  end
end
