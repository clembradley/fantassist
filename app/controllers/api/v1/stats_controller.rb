module V1; end

class Api::V1::StatsController < ApplicationController
  def index
    stats = Stat.where(params.permit(:player_id, :year)).first(50)

    render json: V1::StatPresenter.from_list(stats)
  end

  def show
    stat = Stat.find_by(params.permit(:id))

    if stat
      render json: V1::StatPresenter.new(stat)
    else
      render json: {}
    end
  end
end
