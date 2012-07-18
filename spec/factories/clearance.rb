FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :name do |n|
    "Joe Schmoe #{n}"
  end

  factory :user do
    email
    password "password"

    trait :with_name do
      name
    end
  end

end
