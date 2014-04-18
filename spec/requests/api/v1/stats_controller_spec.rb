require 'spec_helper'

describe Api::V1::StatsController do

  describe 'GET /api/v1/players/:player_id/stats/:year' do
    it 'returns a stat for a player by year' do
      stat = create(:stat)

      get "/api/v1/players/#{stat.player.id}/stats/#{stat.year}"

      expect(response).to be_success
      expect(json_body).to eq(V1::StatPresenter.new(stat).as_json)
    end

    it 'returns an empty json hash if the stat is not found' do
      get '/api/v1/players/-1/stats/2012'

      expect(response).to be_success
      expect(json_body).to eq({})
    end
  end
end
