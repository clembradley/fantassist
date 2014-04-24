require 'spec_helper'

describe Api::V1::DraftPicksController do

  describe 'GET /api/v1/draft_picks' do
    it 'returns an array of draft picks' do
      expected_draft_picks = create_list(:draft_pick, 2)

      get '/api/v1/draft_picks'

      expect(response.status).to eq(200)
      expect(json_body).to eq(expected_draft_picks.map { |dp| V1::DraftPickPresenter.new(dp) }.as_json)
    end
  end

  describe 'DELETE /api/v1/draft_picks' do
    it 'destroys the draft pick and returns 204' do
      draft_pick = create(:draft_pick)

      delete "/api/v1/draft_picks/#{draft_pick.id}"

      expect(response.status).to eq(204)
      expect(DraftPick.find_by(id: draft_pick.id)).to be_nil
    end

    it 'returns a 400 if the draft pick to delete is not found' do
      delete '/api/v1/draft_picks/-1'

      expect(response.status).to eq(400)
      expect(json_body).to eq(errors: ["Draft pick not found"])
    end
  end

  describe 'POST /api/v1/draft_picks' do
    it 'creates a draft pick for the given player and drafter and returns a json representation of the draft_pick' do
      player = create(:player)
      drafter = create(:drafter)

      post '/api/v1/draft_picks', player_id: player.id, drafter_id: drafter.id

      draft_pick = DraftPick.find_by(player_id: player.id, drafter_id: drafter.id)
      expect(draft_pick).to_not be_nil
      expect(response.status).to eq(201)
      expect(json_body).to eq(V1::DraftPickPresenter.new(draft_pick).as_json)
    end

    it 'returns a 400 if the draft pick creation fails' do
      post '/api/v1/draft_picks', player_id: -1, drafter_id: -1

      expect(response.status).to eq(400)
      expect(json_body).to eq(errors: ["Drafter can't be blank", "Player can't be blank"])
    end
  end
end
