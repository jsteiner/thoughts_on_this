FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password "password"

    trait :with_name do
      first_name "Joe"
      last_name "Shmoe"
    end
  end

end
