require 'spec_helper'

describe Stat do
  context 'validations' do
    it { should validate_presence_of(:player) }
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:projection) }
  end
end
