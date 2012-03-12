#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Then 'I should be registered' do
  User.count.should eql 1
end

Then 'I should not be registered' do
  User.count.should eql 0
  page.should have_content('Sorry')
end

When 'I fill in valid account information' do
  register(FactoryGirl.build(:user))
end

When 'I fill in account information with invalid email' do
  register(FactoryGirl.build(:user, :email => 'invalid-email@boocom'))
end

When 'I fill in account information with invalid password confirmation' do
  register(FactoryGirl.build(:user, :password_confirmation => 'wrong'))
end

Then 'I should receive a welcome email' do
  last_sent_email.body.to_s.should have_content('Welcome')
end
