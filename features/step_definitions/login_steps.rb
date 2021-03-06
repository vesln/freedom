#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Given /^I am already registered with "([^"]*)" and "([^"]*)"$/ do |email, password|
  FactoryGirl.create(:user, :email => email, :password => password, :password_confirmation => password)
end

When /^I enter valid login credentials "([^"]*)" and "([^"]*)"$/ do |email, password|
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button 'Sign in'
end

When /^I enter invalid password for "([^"]*)"$/ do |email|
  fill_in 'Email', :with => email
  fill_in 'Password', :with => 'wrong-wrong-wrong'
  click_button 'Sign in'
end

Then "I should be logged in" do
  page.should have_content('Logout')
end
