Given "I am already registered" do
  @user = FactoryGirl.attributes_for(:user)
  FactoryGirl.create(:user, @user)
end

Then "I should be logged in" do
  page.should have_content('Logout')
end

Given 'I fill in valid credentials' do
  fill_in('Email', :with => @user[:email])
  fill_in('Password', :with => @user[:password])
end

Given 'I fill in invalid credentials' do
  fill_in('Email', :with => 'foo')
  fill_in('Password', :with => 'bar')
end
