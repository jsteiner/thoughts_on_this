Given /^I have created a discussion$/ do
  steps %{
    Given I sign in
    And I upload an image with a name
  }
end

Then /^I should not be prompted for my name$/ do
  page.should have_no_css("form#new_name")
end

Then /^I should be prompted for my name$/ do
  page.should have_css("form#new_name")
end

Given /^I visit a discussion page and enter my name$/ do
  steps %{
    Given I visit a discussion page
    When I enter my name
  }
end

When /^I submit my name and return to the discussion page$/ do
  step %{I enter my name}
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

When /^I post the message "(.*?)"$/ do |message|
  within "#new_message" do
    fill_in "message_content", with: message
    click_button "Send"
  end
end

When /^Another person posts the message "(.*?)"$/ do |message|
  Pusher[@discussion.url].trigger('new_message', { message: "<li>#{message}</li>" })
end

Then /^I should be able to post a message$/ do
  page.should have_css("#new_message")
end

Then /^I should not be able to post a message$/ do
  page.should have_no_css("#new_message")
end

Then /^I should see "(.*?)" in the chat box$/ do |message|
  within "#chat" do
    page.should have_css("li", text: message)
  end
end
