require 'spec_helper'

describe Drafter do

  let(:drafter) { create(:drafter) }

  describe 'associations' do
    it 'has many draft picks' do
      expected_draft_picks = create_list(:draft_pick, 2, drafter: drafter)

      expect(drafter.draft_picks).to match_array(expected_draft_picks)
    end

    specify 'associated draft picks get destroyed when a drafter is destroyed' do
      create_list(:draft_pick, 2, drafter: drafter)
      expect(drafter.draft_picks).to be_present

      drafter.destroy

      expect(DraftPick.where(drafter_id: drafter.id)).to be_blank
    end
  end

  describe '#name' do
    it 'returns the first and last name of the drafter\'s user' do
      drafter.user.update_attributes!(first_name: 'Sterling', last_name: 'Archer')

      expect(drafter.name).to eq('Sterling Archer')
    end

    it 'returns just the first name if the last name is blank' do
      drafter.user.update_attributes!(first_name: 'Sterling', last_name: nil)

      expect(drafter.name).to eq('Sterling')
    end

    it 'returns just the last name if the first name is blank' do
      drafter.user.update_attributes!(first_name: nil, last_name: 'Archer')

      expect(drafter.name).to eq('Archer')
    end

    it 'returns blank string if first and last names are nil' do
      drafter.user.update_attributes!(first_name: nil, last_name: nil)

      expect(drafter.name).to eq('')
    end
  end

  context 'validations' do
    subject { build(:drafter) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:league) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to belong_to(:league) }
  end
end
