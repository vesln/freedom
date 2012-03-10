#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Given "I am logged in" do
  self.current_user = FactoryGirl.build(:user)
  current_user.save!
  visit path_to('the login page')
  fill_in 'Email', :with => current_user.email
  fill_in 'Password', :with => current_user.password
  click_button 'Sign in'
end

Then 'I should be logged out' do
  page.should have_content('Successful logout')
end
