require 'spec_helper'

describe Api::V1::StatsController do

  describe 'GET /api/v1/stats' do
    it 'returns all stats' do
      stat_1 = create(:stat)
      stat_2 = create(:stat)

      get '/api/v1/stats'

      expect(response).to be_success
      expect(json_body).to eq([V1::StatPresenter.new(stat_1), V1::StatPresenter.new(stat_2)].as_json)
    end
  end

  describe 'GET /api/v1/stats/:id' do
    it 'returns a stat for a given id' do
      stat = create(:stat)

      get "/api/v1/stats/#{stat.id}"

      expect(response).to be_success
      expect(json_body).to eq(V1::StatPresenter.new(stat).as_json)
    end

    it 'returns an empty json hash if the stat is not found' do
      get '/api/v1/stats/-1'

      expect(response).to be_success
      expect(json_body).to eq({})
    end
  end
end
