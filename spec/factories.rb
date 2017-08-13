# rubocop:disable Metrics/BlockLength
FactoryGirl.define do
  factory :activity do
    sequence(:name) { |n| "activity#{n}" }
  end

  factory :sport do
    sequence(:name) { |n| "sport#{n}" }
  end

  factory :activity_sport do
    activity
    sport
  end

  factory :organization do
    sequence(:name) { |n| "organization#{n}" }
  end

  factory :organization_user do
    organization
    user
  end

  factory :organization_sport do
    organization
    sport
  end

  factory :event do
    sequence(:name) { |n| "event#{n}" }
    organization
    starts_at '2017-08-01'
  end

  factory :discipline do
    sequence(:name) { |n| "discipline#{n}" }
    sport
    event
  end

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    confirmed_at { Time.current }

    factory :unconfirmed_user do
      confirmed_at nil
    end
  end

  factory :registration do
    user
    discipline
  end

  factory :race do
    discipline
  end

  factory :participation do
    race
    after(:build) do |participation|
      participation.race.discipline.number_of_crew.times do
        participation.registration_participations.append(
          build(:registration_participation, participation: participation)
        )
      end
    end
  end

  factory :registration_participation do
    registration
    participation
  end

  factory :check_point do
    discipline
  end

  factory :result do
    participation
    check_point
    time_in_s 112.251
  end
end
