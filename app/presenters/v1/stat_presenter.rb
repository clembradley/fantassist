class V1::StatPresenter

  def initialize(stat)
    @stat = stat
  end

  def as_json(options = {})
    {
      at_bats: @stat.at_bats,
      batting_average: @stat.batting_average && sprintf("%0.03f", @stat.batting_average),
      earned_runs: @stat.earned_runs,
      games_played: @stat.games_played,
      hit_by_pitch: @stat.hit_by_pitch,
      hits: @stat.hits,
      hits_given_up: @stat.hits_given_up,
      home_runs: @stat.home_runs,
      innings_pitched: @stat.innings_pitched,
      on_base_percentage: @stat.on_base_percentage && sprintf("%0.03f", @stat.on_base_percentage),
      plate_appearances: @stat.plate_appearances,
      player: V1::PlayerPresenter.new(@stat.player).as_json,
      projection: @stat.projection,
      quality_starts: @stat.quality_starts,
      rbis: @stat.rbis,
      runs: @stat.runs,
      saves: @stat.saves,
      stolen_bases: @stat.stolen_bases,
      strikeouts: @stat.strikeouts,
      walks_drawn: @stat.walks_drawn,
      walks_given_up: @stat.walks_given_up,
      wins: @stat.wins,
      year: @stat.year
    }
  end
end
