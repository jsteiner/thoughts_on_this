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
  within "#messages" do
    wait_until do
      find('li', text: message)
    end
  end
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
