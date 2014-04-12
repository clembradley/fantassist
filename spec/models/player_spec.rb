require 'spec_helper'

describe Player do
  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:organization) }
    it { should ensure_inclusion_of(:position).in_array(Player::POSITIONS) }
    it { should ensure_inclusion_of(:organization).in_array(Player::ORGANIZATIONS) }
  end
end
