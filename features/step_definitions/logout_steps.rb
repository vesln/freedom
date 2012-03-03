Given "I'm logged in" do
  backdoor_login FactoryGirl.create(:user)
end

Given "I'm on the dashboard page" do
  visit dashboard_path
end
