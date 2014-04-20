module V1; end

class Api::V1::StatsController < ApplicationController
  def index
    stats = Stat.first(50)

    stat_presenters = stats.map { |stat| V1::StatPresenter.new(stat) }

    render json: stat_presenters
  end

  def show
    stat = Stat.find_by(_stat_params)

    if stat
      render json: V1::StatPresenter.new(stat)
    else
      render json: {}
    end
  end

  def _stat_params
    params.permit(:id)
  end
end
