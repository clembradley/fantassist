class V1::StatPresenter

  def initialize(stat)
    @stat = stat
  end

  def as_json(options = {})
    {
      at_bats: @stat.at_bats,
      earned_runs: @stat.earned_runs,
      hits: @stat.hits,
      hits_given_up: @stat.hits_given_up,
      home_runs: @stat.home_runs,
      innings_pitched: @stat.innings_pitched,
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
