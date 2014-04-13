require 'spec_helper'

describe Stat do
  context 'validations' do
    it { should validate_presence_of(:player) }
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:year) }
    it { should allow_value(true).for(:projection) }
    it { should allow_value(false).for(:projection) }
    it { should_not allow_value(nil).for(:projection) }
  end
end
