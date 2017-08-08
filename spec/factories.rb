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

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    confirmed_at { Time.current }

    factory :unconfirmed_user do
      confirmed_at nil
    end
  end
end
