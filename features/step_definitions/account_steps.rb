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
