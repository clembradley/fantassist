require 'spec_helper'

describe V1::StatPresenter do

  describe '#as_json' do
    it 'returns the expected json representation of a stat' do
      stat = build(:stat, :hitter, :pitcher)

      stat_presenter = V1::StatPresenter.new(stat)

      expected_stat = {
        at_bats: stat.at_bats,
        batting_average: sprintf("%0.03f", stat.batting_average.to_f),
        earned_runs: stat.earned_runs,
        games_played: stat.games_played,
        hit_by_pitch: stat.hit_by_pitch,
        hits: stat.hits,
        hits_given_up: stat.hits_given_up,
        home_runs: stat.home_runs,
        id: stat.id,
        innings_pitched: stat.innings_pitched,
        on_base_percentage: sprintf("%0.03f", stat.on_base_percentage.to_f),
        plate_appearances: stat.plate_appearances,
        player: V1::PlayerPresenter.new(stat.player).as_json,
        projection: stat.projection,
        quality_starts: stat.quality_starts,
        rbis: stat.rbis,
        runs: stat.runs,
        saves: stat.saves,
        stolen_bases: stat.stolen_bases,
        strikeouts: stat.strikeouts,
        walks_drawn: stat.walks_drawn,
        walks_given_up: stat.walks_given_up,
        wins: stat.wins,
        year: stat.year
      }

      expect(stat_presenter.as_json).to eq(expected_stat)
    end
  end

  describe '.from_list' do
    it 'returns an array of stat presenters' do
      stats = create_list(:stat, 2)

      expect(V1::StatPresenter.from_list(stats).map(&:class)).to eq([V1::StatPresenter, V1::StatPresenter])
    end
  end
end
