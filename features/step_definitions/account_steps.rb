When /^I change my password to "([^"]*)"$/ do |password|
  fill_in 'Password', :with => password
  fill_in 'Password confirmation', :with => password
  click_on 'Save'
end

Then /^I should be able to login with my new password "([^"]*)"$/ do |password|
  login!(current_user.email, password)
end

Then 'I should be to login with my old password' do
  login!(current_user.email, current_user.password)
end
