Given "I'm on the signup page" do
  visit new_registration_path
end

Then 'I should be registered' do
  User.count.should eql 1
end
