FactoryGirl.define do
  factory :drafter do
    name { Faker::Address.city }
    user
  end
end
