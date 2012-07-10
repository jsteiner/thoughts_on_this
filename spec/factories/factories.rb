include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :discussion do
    name 'A discussion'
    user

    trait :image do
      association :subject, factory: :image_subject
    end

    trait :text do
      association :subject, factory: :text_subject
    end

    factory :text_discussion, traits: [:text]
  end

  factory :image_subject do
    image { fixture_file_upload('features/support/test_image.png', 'image/png') }
  end

  factory :text_subject do
  end

  factory :message do
    content 'Hello World!'
    association :discussion, factory: :text_discussion
  end
end
