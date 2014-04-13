FactoryGirl.define do
  factory :stat do
    player
    projection { [true, false].sample }
    year { [2012, 2013, 2014].sample }
  end
end
