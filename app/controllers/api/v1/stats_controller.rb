module V1; end

class Api::V1::StatsController < ApplicationController
  def show
    stat = Stat.find_by(_stat_params)

    if stat
      render json: V1::StatPresenter.new(stat)
    else
      render json: {}
    end
  end

  def _stat_params
    params.permit(:player_id, :year)
  end
end
