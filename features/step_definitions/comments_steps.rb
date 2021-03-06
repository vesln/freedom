Given /^The task "([^"]*)" exists$/ do |name|
  FactoryGirl.create(:task, :project => current_project)
end

When /^I fill in comment "([^"]*)"$/ do |body|
  fill_in 'Comment', :with => body
  click_button 'Submit'
end
