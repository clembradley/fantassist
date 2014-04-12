FactoryGirl.define do
  factory :player do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { Player::POSITIONS.sample }
    organization { Player::ORGANIZATIONS.sample }
  end
end
