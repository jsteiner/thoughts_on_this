# User

Given /^I have created a discussion$/ do
  steps %{
    Given I sign in
    And I upload an image with a name
  }
end

Then /^I should not be prompted for my name$/ do
  page.should have_no_css("form input#username")
end

# Guest

Then /^I should be prompted for my name$/ do
  page.should have_css("form#new_guest")
end

Given /^I visit a discussion page and enter my name$/ do
  step %{I visit a discussion page}
  fill_in "guest_email", with: "my name"
  click_button 'Join discussion'
end

# Any

Given /^I visit a discussion page$/ do
  discussion = create(:discussion, :image)
  visit discussion_path(discussion)
end

When /^I post a message$/ do
  within "#new_message" do
    fill_in "message_content", with: "something"
    click_button "Send"
  end
end

Then /^I should see the message in the chat box$/ do
  within "#chat" do
    page.should have_css("li", text: "something")
  end
end
