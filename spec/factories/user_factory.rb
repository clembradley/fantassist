FactoryGirl.define do
  factory :user do
    email { "#{SecureRandom.hex[1..10]}+#{Faker::Internet.safe_email}" }
  end
end
