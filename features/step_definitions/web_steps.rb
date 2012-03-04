When /^I click on "([^"]*)"$/ do |field|
  click_on field
end

When /^(?:|I )fill in the following(?: within "([^"]*)")?:$/ do |selector, fields| fields.rows_hash.each do |name, value|
    fill_in(name, :with => value)
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end
