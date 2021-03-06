FactoryGirl.define do
  factory :stat do
    player
    projection false
    year { [2012, 2013, 2014].sample }

    trait :hitter do
      at_bats { rand(401..620) }
      games_played { rand(140..162) }
      hit_by_pitch { rand(1..20) }
      hits { rand(115..200) }
      home_runs { rand(16..50) }
      plate_appearances { rand(450..700) }
      rbis { rand(50..140) }
      runs { rand(50..140) }
      stolen_bases { rand(0..55) }
      walks_drawn { rand(40..130) }
    end

    trait :pitcher do
      earned_runs { rand(90..120) }
      games_played { rand(28..34) }
      hits_given_up { rand(100..200) }
      innings_pitched { rand(150..240) }
      quality_starts { rand(8..30) }
      saves { rand(0..30) }
      strikeouts { rand(100..250) }
      walks_given_up { rand(40..130) }
      wins { rand(5..24) }
    end

    trait :projection do
      projection true
    end
  end
end
