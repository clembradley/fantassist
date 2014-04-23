require 'spec_helper'

describe V1::DraftPickPresenter do

  describe '#as_json' do
    it 'returns the expected json representation of a draft pick' do
      draft_pick = create(:draft_pick)

      draft_pick_presenter = V1::DraftPickPresenter.new(draft_pick)

      expect(draft_pick_presenter.as_json).to eq(
        player: V1::PlayerPresenter.new(draft_pick.player).as_json,
        drafter: {name: draft_pick.drafter.name}
      )
    end
  end
end
