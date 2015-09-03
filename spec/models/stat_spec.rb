require 'spec_helper'

describe Stat do

  describe '.undrafted' do

    it 'returns all stats who are not associated with a draft pick' do
      expected_stats = create_list(:stat, 2, year: 2013)
      not_expected_stat = create(:stat, year: 2013)
      create(:draft_pick, player: not_expected_stat.player)

      expect(Stat.undrafted).to eq(expected_stats)
    end

    it 'returns a relation that can be queried with other ActiveRecord queries' do
      expected_stats = create_list(:stat, 2, year: 2013)
      create(:stat, year: 2012)

      expect(Stat.undrafted.where(year: 2013)).to eq(expected_stats)
    end
  end

  describe '#batting_average' do
    it 'returns a float of hits divided by the number of at bats' do
      at_bats = 402
      hits = 158
      expected_average = hits / at_bats.to_f
      stat = build(:stat, at_bats: at_bats, hits: hits)

      expect(stat.batting_average).to eq(expected_average)
    end

    it 'returns nil if the stat has no at_bats' do
      stat = build(:stat, at_bats: nil, hits: 100)

      expect(stat.batting_average).to be_nil
    end
  end

  describe '#on_base_percentage' do
    it 'returns a float of walks + hits + hbp, divided by plate appearances' do
      walks = 75
      hits = 156
      hbp = 14
      plate_appearances = 700
      stat = build(:stat, walks_drawn: walks, hits: hits, hit_by_pitch: hbp, plate_appearances: plate_appearances)

      expected_obp = (hits + walks + hbp) / plate_appearances.to_f

      expect(stat.on_base_percentage).to eq(expected_obp)
    end

    it 'returns nil if the stat has no plate_appearances' do
      stat = build(:stat, walks_drawn: 5, hits: 100, hit_by_pitch: 7, plate_appearances: nil)

      expect(stat.on_base_percentage).to be_nil
    end
  end

  context 'validations' do
    subject { build(:stat) }

    it { is_expected.to validate_presence_of(:player) }
    it { is_expected.to validate_presence_of(:player_id) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to allow_value(true).for(:projection) }
    it { is_expected.to allow_value(false).for(:projection) }
    it { is_expected.not_to allow_value(nil).for(:projection) }
  end
end
