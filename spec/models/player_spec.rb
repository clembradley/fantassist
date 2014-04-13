require 'spec_helper'

describe Player do

  it 'has many draft picks' do
    player = create(:player)
    expected_draft_picks = [create(:draft_pick, player: player), create(:draft_pick, player: player)]

    expect(player.reload.draft_picks.sort).to eq(expected_draft_picks.sort)
  end

  it 'has many stats' do
    player = create(:player)
    expected_stats = [create(:stat, player: player), create(:stat, player: player)]

    expect(player.reload.stats.sort).to eq(expected_stats.sort)
  end

  specify 'associated draft picks get destroyed when a player is destroyed' do
    player = create(:player)
    2.times { create(:draft_pick, player: player) }
    expect(player.reload.draft_picks).to_not be_nil

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

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:organization) }
    it { should ensure_inclusion_of(:position).in_array(Player::POSITIONS) }
    it { should ensure_inclusion_of(:organization).in_array(Player::ORGANIZATIONS) }
  end
end
