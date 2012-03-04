Given /^I am already registered with "([^"]*)" and "([^"]*)"$/ do |email, password|
  FactoryGirl.create(:user, :email => email, :password => password, :password_confirmation => password)
end

Then "I should be logged in" do
  page.should have_content('Logout')
end
