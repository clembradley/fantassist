require 'spec_helper'

describe Drafter do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
  end
end
