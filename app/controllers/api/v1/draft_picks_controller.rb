module V1; end

class Api::V1::DraftPicksController < ApplicationController

  def create
    draft_pick = DraftPick.new(params.permit(:drafter_id, :player_id))

    if draft_pick.save
      render json: V1::DraftPickPresenter.new(draft_pick), status: :created
    else
      render json: V1::ErrorsPresenter.new(draft_pick.errors), status: :bad_request
    end
  end

  def destroy
    draft_pick = DraftPick.find_by(params.permit(:id))

    if draft_pick
      draft_pick.destroy
      head :no_content
    else
      render json: {errors: ["Draft pick not found"]}, status: :bad_request
    end
  end

  def index
    draft_picks = DraftPick.where(params.permit(:drafter_id))
    draft_pick_presenters = draft_picks.map { |dp| V1::DraftPickPresenter.new(dp) }

    render json: draft_pick_presenters
  end
end
