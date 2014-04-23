class DraftController < ApplicationController

  def index
    #TODO: remove this temporary where clause once pagination is in place
    stats = Stat.undrafted.where('at_bats > 400 AND home_runs > 15')
    @stats = stats.map { |stat| V1::StatPresenter.new(stat) }
  end
end
