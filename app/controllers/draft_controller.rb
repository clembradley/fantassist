class DraftController < ApplicationController

  def index
    #TODO: remove this temporary where clause once pagination is in place
    stats = Stat.undrafted.where('at_bats > 400 AND home_runs > 15').includes(:player)
    @stats = stats.map { |stat| V1::StatPresenter.new(stat) }
    @current_drafter = Drafter.find_by(name: 'default') #TODO base this off current_user once implemented
    draft_picks = DraftPick.all.includes(:player).includes(:drafter)
    @draft_picks = draft_picks.map { |draft_pick| V1::DraftPickPresenter.new(draft_pick)}
  end
end
