require 'spec_helper'

describe V1::PlayerPresenter do

  describe '#as_json' do
    it 'returns the expected json representation of a player' do
      player = create(:player)

      player_presenter = V1::PlayerPresenter.new(player)

      expect(player_presenter.as_json).to eq(
        first_name: player.first_name,
        id: player.id,
        last_name: player.last_name,
        organization: player.organization,
        position: player.position
      )
    end
  end
end
