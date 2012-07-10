Given /^I have created a discussion$/ do
  steps %{
    Given I sign in
    And I upload an image
  }
end

When /^I enter my name$/ do
  within "#new_name" do
    fill_in "first_name", with: "Joe"
    fill_in "last_name", with: "Shmoe"
    click_button "Join discussion"
  end
end

Given /^I visit a discussion page$/ do
  @discussion = create(:discussion, :image)
  visit discussion_path(@discussion)
end

When /^I upload the text "(.*?)"$/ do |text_content|
  within '#new_text_subject' do
    fill_in 'discussion_name', with: 'An appropriate name'
    fill_in 'text_subject_content', with: text_content
    click_button 'Discuss'
  end
end

Then /^I should see "(.*?)" on the page$/ do |text_content|
  page.should have_content(text_content)
end

When /^I update the text to say "(.*?)"$/ do |text_content|
  click_link 'Update'
  fill_in 'text_subject_content', with: text_content
  click_button 'Discuss'
end

When /^I upload the image "(.*?)"$/ do |filename|
  within '#new_image_subject' do
    fill_in 'discussion_name', with: 'something'
    attach_file('image_subject_image',
                File.join(Rails.root, "features/support/#{filename}"))
    click_button 'Discuss'
  end
end

Then /^I should see the image "(.*?)" on the page$/ do |filename|
  page.should have_css('img', src: /#{filename}/)
end

When /^I update the image with "(.*?)"$/ do |filename|
  click_link 'Update'
  attach_file('image_subject_image',
              File.join(Rails.root, "features/support/#{filename}"))
  click_button 'Discuss'
end
