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
