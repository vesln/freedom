#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Given 'There are few existing projects' do
  1.upto(5) do |i|
    FactoryGirl.create(:project, :name => 'Project ' << i.to_s)
  end
end

Then 'I should see the projects' do
  1.upto(5) do |i|
    page.should have_content('Project ' << i.to_s)
  end
end

Then /^I create a new project with name "([^"]*)"$/ do |name|
  fill_in 'Name', :with => name
  click_button 'Save'
end

Then /^there should be a project "([^"]*)"$/ do |name|
  page.should have_content(name)
end

Given 'I try to create a new project with invalid data' do
  click_button 'Save'
end

Then 'the project should not exist' do
  page.should have_content('Sorry')
end

Given /^There are project "([^"]*)"$/ do |name|
  FactoryGirl.create(:project, :name => name)
end

When /^I edit the project "([^"]*)"$/ do |name|
  click_link 'Edit'
end

When /^I rename the project to "([^"]*)"$/ do |name|
  fill_in 'Name', :with => name
  click_button 'Save'
end

Then /^the project should be renamed from "([^"]*)" to "([^"]*)"$/ do |old_name, new_name|
  page.should have_content(new_name)
  page.should_not have_content(old_name)
end

When /^I delete the project "([^"]*)"$/ do |name|
  click_link 'Delete'
end

Then /^the project "([^"]*)" should be deleted$/ do |name|
  page.should_not have_content(name)
end
