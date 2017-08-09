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
  end

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    confirmed_at { Time.current }

    factory :unconfirmed_user do
      confirmed_at nil
    end
  end
end
