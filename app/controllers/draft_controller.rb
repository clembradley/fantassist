class DraftController < ApplicationController

  before_action { redirect_to new_user_session_path unless user_signed_in? }

  def index
    #TODO: remove this temporary where clause once pagination is in place
    stats = Stat.undrafted.where('at_bats > 400 AND home_runs > 15').includes(:player)
    @stats = stats.map { |stat| V1::StatPresenter.new(stat) }
    @current_drafter = current_user.drafters.first
    draft_picks = @current_drafter.draft_picks.includes(:player).includes(:drafter)
    @draft_picks = draft_picks.map { |draft_pick| V1::DraftPickPresenter.new(draft_pick)}
  end
end
