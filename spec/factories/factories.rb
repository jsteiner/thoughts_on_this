include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :discussion do
    name "A discussion"
    user

    trait(:image) do
      association :subject, factory: :image_subject
    end
  end

  factory :image_subject do
    image { fixture_file_upload('features/support/test_image.png', 'image/png') }
  end

  factory :message do
    content "Hello World!"
  end
end
