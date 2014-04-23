module V1; end

class Api::V1::DraftPicksController < ApplicationController

  def create
    draft_pick = DraftPick.new(_draft_pick_params)

    if draft_pick.save
      render json: V1::DraftPickPresenter.new(draft_pick)
    else
      render json: V1::ErrorsPresenter.new(draft_pick.errors), status: :unprocessable_entity
    end
  end

  def index
    draft_picks = DraftPick.all
    draft_pick_presenters = draft_picks.map { |dp| V1::DraftPickPresenter.new(dp) }

    render json: draft_pick_presenters
  end

  def _draft_pick_params
    params.permit(:drafter_id, :player_id)
  end
end
