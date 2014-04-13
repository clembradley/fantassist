require 'spec_helper'

describe Drafter do
  it 'has many draft picks' do
    drafter = create(:drafter)
    expected_draft_picks = [create(:draft_pick, drafter: drafter), create(:draft_pick, drafter: drafter)]

    drafter.reload

    expect(drafter.draft_picks.sort).to eq(expected_draft_picks.sort)
  end

  specify 'associated draft picks get destroyed when a drafter is destroyed' do
    drafter = create(:drafter)
    2.times { create(:draft_pick, drafter: drafter) }
    expect(drafter.reload.draft_picks).to_not be_nil

    drafter.destroy

    expect(DraftPick.where(drafter_id: drafter.id)).to be_empty
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
  end
end
