require 'spec_helper'

describe Api::V1::StatsController do

  describe 'GET /api/v1/stats' do
    it 'returns stats' do
      stats = create_list(:stat, 2)

      get '/api/v1/stats'

      expect(response).to be_success
      expect(json_body).to eq(V1::StatPresenter.from_list(stats).as_json)
    end

    it 'can optionally return stats by year' do
      expected_stat = create(:stat, year: 2013)
      create(:stat, year: 2012)

      get "/api/v1/stats?year=#{expected_stat.year}"

      expect(response).to be_success
      expect(json_body).to eq([V1::StatPresenter.new(expected_stat).as_json])
    end

    it 'can optionally return stats by player_id' do
      expected_stat = create(:stat)
      not_expected_stat = create(:stat)
      expect(expected_stat.player).to_not eq(not_expected_stat.player)

      get "/api/v1/stats?player_id=#{expected_stat.player_id}"

      expect(response).to be_success
      expect(json_body).to eq([V1::StatPresenter.new(expected_stat)].as_json)
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
