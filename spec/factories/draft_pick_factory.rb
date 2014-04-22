FactoryGirl.define do
  factory :draft_pick do
    player
    drafter

    trait :with_stat do
      after(:create) do |draft_pick|
        type = [:hitter, :pitcher].sample
        create(:stat, type, player: draft_pick.player)
      end
    end
  end
end
