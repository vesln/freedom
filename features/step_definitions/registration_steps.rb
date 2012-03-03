Given "I'm on the signup page" do
  visit new_registration_path
end

When /^(?:|I )fill in the following(?: within "([^"]*)")?:$/ do |selector, fields|
  fields.rows_hash.each do |name, value|
    fill_in(name, :with => value)
  end
end

When /^I click on "([^"]*)"$/ do |field|
  click_on field
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then 'I should be registered' do
  User.count.should eql 1
end
