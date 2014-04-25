require 'spec_helper'

describe Drafter do

  describe 'associations' do

    let(:drafter) { create(:drafter) }

    it 'has many draft picks' do
      expected_draft_picks = create_list(:draft_pick, 2, drafter: drafter)

      expect(drafter.draft_picks.sort).to eq(expected_draft_picks.sort)
    end

    specify 'associated draft picks get destroyed when a drafter is destroyed' do
      create_list(:draft_pick, 2, drafter: drafter)
      expect(drafter.draft_picks).to be_present

      drafter.destroy

      expect(DraftPick.where(drafter_id: drafter.id)).to be_blank
    end
  end

  context 'validations' do
    subject { build(:drafter) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
  end
end
