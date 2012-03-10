Given "I am logged in" do
  user = FactoryGirl.create(:user)
  visit path_to('the login page')
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
end

Then 'I should be logged out' do
  page.should have_content('Successful logout')
end
