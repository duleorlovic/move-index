FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    confirmed_at { Time.current }

    factory :unconfirmed_user do
      confirmed_at nil
    end
  end
end
