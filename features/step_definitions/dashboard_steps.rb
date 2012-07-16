When /^I visit the dashboard$/ do
  visit dashboard_path
end

Then /^I should be redirected to my dashboard$/ do
  step %{I should be on the dashboard page}
end

Then /^I should be on the dashboard page$/ do
  current_path.should == dashboard_path
end

Then /^I should be directed to sign in$/ do
  current_path.should == '/sign_in'
end

When /^I upload an image$/ do
  upload_image 'test_image.png'
end

When /^I upload text$/ do
  upload_text 'text'
end

Then /^I should see the text and title on the page$/ do
  page.should have_css(".text-content")
  page.should have_css("[data-role='discussion-name']")
end

When /^I upload an invalid image$/ do
  within '#new_image_subject' do
    fill_in 'discussion_name', with: 'something'
    attach_file('image_subject_image',
                File.join(Rails.root, 'features/support/env.rb'))
    click_button 'Discuss'
  end
end

Then /^I should see an error message$/ do
  page.should have_css('#error-messages')
end

Then /^I should see the image and title on the page$/ do
  page.should have_css("img[alt=subject]")
  page.should have_css("[data-role='discussion-name']")
end
