require "spec_helper"

describe League do

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_many(:drafters) }
  end
end
