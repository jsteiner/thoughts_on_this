When /^I visit the dashboard$/ do
  visit dashboard_path
end

Then /^I should be redirected to my dashboard$/ do
  step %{I should be on the dashboard page}
end

Then /^I should be on the dashboard page$/ do
  current_path.should == '/dashboard'
end

Then /^I should be directed to sign in$/ do
  current_path.should == '/sign_in'
end

# Uploading

When /^I upload an image with a name$/ do
  fill_in 'discussion_name', with: 'something'
  attach_file('image_subject_image',
              File.join(Rails.root, 'features/support/test_image.png'))
  click_button 'Discuss'
end

When /^I upload an invalid image$/ do
  fill_in 'discussion_name', with: 'something'
  attach_file('image_subject_image',
              File.join(Rails.root, 'features/support/env.rb'))
  click_button 'Discuss'
end

Then /^I should see an error message$/ do
  page.should have_css('#error-messages')
end

Then /^I should see the image and name on the page$/ do
  page.should have_css("img[alt=subject]")
  page.should have_css("[data-role='discussion-name']")
end

Then /^I should see the discussion in my list of discussions$/ do
  discussion = Discussion.last
  within 'ul#discussions' do
    page.should have_css("li a[href='#{discussion_path(discussion)}']", text: discussion.name)
  end
end
