require 'spec_helper'

describe DraftPick do
  describe 'validations' do
    subject { build(:draft_pick) }

    it { is_expected.to validate_presence_of(:drafter_id) }
    it { is_expected.to validate_presence_of(:drafter) }
    it { is_expected.to validate_presence_of(:player_id) }
    it { is_expected.to validate_presence_of(:player) }
    it { is_expected.to validate_uniqueness_of(:player_id) }
  end
end
