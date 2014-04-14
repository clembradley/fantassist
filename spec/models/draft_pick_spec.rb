require 'spec_helper'

describe DraftPick do
  describe 'validations' do
    it { should validate_presence_of(:drafter_id) }
    it { should validate_presence_of(:drafter) }
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:player) }
    it { should validate_uniqueness_of(:player_id) }
  end
end
