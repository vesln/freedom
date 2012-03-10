Given /^I am logged in with "([^"]*)"$/ do |email|
  user = User.where(:email => email).first || FactoryGirl.create(:user, :email => email)
  backdoor_login user
end

Then /^I should be to login with "([^"]*)" and "([^"]*)"$/ do |email, password|
  UserSession.new(:email => email, :password => password).save.should === true
end

Given /^I am registered as "([^"]*)" and "([^"]*)"$/ do |email, password|
  FactoryGirl.create(:user, :email => email, :password => password, :password_confirmation => password)
end

When /^I change my password to "([^"]*)"$/ do |password|
  fill_in 'Password', :with => password
  fill_in 'Password confirmation', :with => password
  click_on 'Save'
end

Then /^I should be able to login with my new password "([^"]*)"$/ do |password|
  UserSession.new(:email => current_user.email, :password => password).save.should === true
end

Then 'I should be to login with my old password' do
  UserSession.new(:email => current_user.email, :password => current_user.password).save.should === true
end
