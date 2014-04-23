require 'spec_helper'

describe Api::V1::DraftPicksController do

  describe 'GET /api/v1/draft_picks' do
    it 'returns an array of draft picks' do
      expected_draft_picks = create_list(:draft_pick, 2)

      get '/api/v1/draft_picks'

      expect(json_body).to eq(expected_draft_picks.map { |dp| V1::DraftPickPresenter.new(dp) }.as_json)
    end

  end

  describe 'POST /api/v1/draft_picks' do
    it 'creates a draft pick for the given player and drafter and returns a json representation of the draft_pick' do
      player = create(:player)
      drafter = create(:drafter)

      post '/api/v1/draft_picks', player_id: player.id, drafter_id: drafter.id

      draft_pick = DraftPick.find_by(player_id: player.id, drafter_id: drafter.id)
      expect(draft_pick).to_not be_nil
      expect(json_body).to eq(V1::DraftPickPresenter.new(draft_pick).as_json)
    end

    it 'returns a 422 if the draft pick creation fails' do
      post '/api/v1/draft_picks', player_id: -1, drafter_id: -1

      expect(json_body).to eq(errors: ["Drafter can't be blank", "Player can't be blank"])
    end
  end
end
