require 'spec_helper'

describe Drafter do
  it 'has many draft picks' do
    drafter = create(:drafter)
    expected_draft_picks = [create(:draft_pick, drafter: drafter), create(:draft_pick, drafter: drafter)]

    drafter.reload

    expect(drafter.draft_picks.sort).to eq(expected_draft_picks.sort)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
  end
end
