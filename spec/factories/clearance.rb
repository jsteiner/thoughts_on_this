FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :first_name do |n|
    "Joe#{n}"
  end

  sequence :last_name do |n|
    "Schmoe#{n}"
  end

  factory :user do
    email
    password "password"

    trait :with_name do
      first_name
      last_name
    end
  end

end
