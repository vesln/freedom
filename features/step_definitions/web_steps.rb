When /^I click on "([^"]*)"$/ do |field|
  click_on field
end

When /^(?:|I )fill in the following(?: within "([^"]*)")?:$/ do |selector, fields| 
  fields.rows_hash.each do |name, value|
    fill_in(name, :with => value)
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  current_path.should == path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^There are "([^"]*)" called "([^"]*)"$/ do |model, name|
  FactoryGirl.create(model, :name => name)
end
