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
