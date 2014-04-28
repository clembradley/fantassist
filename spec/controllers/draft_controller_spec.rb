require 'spec_helper'

describe DraftController do

  describe 'GET index' do
    it 'assigns @draft_picks' do
      draft_picks = create_list(:draft_pick, 2)
      expected_draft_picks = draft_picks.map { |dp| V1::DraftPickPresenter.new(dp) }

      get :index

      expect(assigns(:draft_picks)).to eq(expected_draft_picks)
    end

    it 'assigns @stats' do
      stats = create_list(:stat, 2, :hitter)
      expected_stats = stats.map { |stat| V1::StatPresenter.new(stat) }

      get :index

      expect(assigns(:stats)).to eq(expected_stats)
    end

    it 'assigns @current_drafter to the default drafter' do
      expected_drafter = create(:drafter, name: 'default')

      get :index

      expect(assigns(:current_drafter)).to eq(expected_drafter)
    end
  end
end
