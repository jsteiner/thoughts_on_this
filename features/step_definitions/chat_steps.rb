Given /^I have created a discussion$/ do
  steps %{
    Given I sign in
    And I upload an image with a name
  }
end

When /^I post a message$/ do
  within "#new_message" do
    fill_in "message_content", with: "something"
    click_button "Send"
  end
end

Then /^I should see the message in the chat box$/ do
  current_user = User.first
  within "#chat" do
    page.should have_css("li", text: /#{current_user.email}/)
    page.should have_css("li", text: "something")
  end
end
