Given /^I am logged in with "([^"]*)"$/ do |email|
  backdoor_login FactoryGirl.create(:user, :email => email)
end

Then /^I should be to login with "([^"]*)" and "([^"]*)"$/ do |email, password|
  UserSession.new(:email => email, :password => password).save.should === true
end
