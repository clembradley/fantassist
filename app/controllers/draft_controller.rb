class DraftController < ApplicationController

  def index
    stats = Stat.where('at_bats > 400 AND home_runs > 15')
    @stats = stats.map { |stat| V1::StatPresenter.new(stat) }
  end
end
