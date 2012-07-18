Given /^I have created a discussion$/ do
  steps %{
    Given I sign in
    And I upload an image
  }
end

When /^I enter my name$/ do
  within "#new_name" do
    fill_in "name", with: "Joe Schmoe"
    click_button "Join discussion"
  end
end

Given /^I visit a discussion page$/ do
  @discussion = create(:discussion, :image)
  visit discussion_path(@discussion)
end

When /^I upload the text "(.*?)"$/ do |text_content|
  upload_text text_content
end

Then /^I should see "(.*?)" on the page$/ do |text_content|
  page.should have_content(text_content)
end

When /^I upload the image "(.*?)"$/ do |filename|
  upload_image filename
end

Then /^I should see the image "(.*?)" on the page$/ do |filename|
  page.should have_css('img', src: /#{filename}/)
end

Then /^I should see the discussion in my list of discussions$/ do
  visit discussions_url
  discussion = Discussion.last
  within 'ul#discussions' do
    page.should have_css("li a[href='#{discussion_path(discussion)}']", text: discussion.name)
  end
end
