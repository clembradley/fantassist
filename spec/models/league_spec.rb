require "spec_helper"

describe League do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should have_many(:drafters) }
  end
end
