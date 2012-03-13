#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Given /^I am working on project "([^"]*)"$/ do |name|
  create_project(:name => name)
end

Given 'There are few existing milestones for this project' do
  project_id = current_project.id
  1.upto(5) do |i|
    FactoryGirl.create(:milestone, :name => i.to_s << '.0', :project_id => project_id)
  end
end

Then 'I should see the milestones for the project' do
  1.upto(5) do |i|
    page.should have_content(i.to_s << '.0')
  end
end

When /^I create a new milestone with name "([^"]*)"$/ do |name|
  fill_in 'Name', :with => name
  click_button 'Save'
end

Then /^there should be a milestone "([^"]*)"$/ do |name|
  page.should have_content(name)
end

When /^I try to create a milestone with invalid data$/ do
  click_button 'Save'
end

Then /^the milestone should not exist$/ do
  page.should have_content('Sorry')
end

Given /^There are milestone "([^"]*)"$/ do |name|
  FactoryGirl.create(:milestone, :name => name, :project_id => current_project.id)
end

When /^I edit the milestone "([^"]*)"$/ do |name|
  click_link 'Edit'
end

When /^I rename the milestone from "([^"]*)" to "([^"]*)"$/ do |old_name, new_name|
  fill_in 'Name', :with => new_name
  click_button 'Save'
end

Then /^the milestone should be renamed from "([^"]*)" to "([^"]*)"$/ do |old_name, new_name|
  page.should have_content(new_name)
  page.should_not have_content(old_name)
end

When /^I delete the milestone "([^"]*)"$/ do |name|
  click_link 'Delete'
end

Then /^the milestone "([^"]*)" should be deleted$/ do |name|
  page.should_not have_content(name)
end

Given /^There are one milestone and "([^"]*)" completed tasks from "([^"]*)"$/ do |completed, total|
  milestone = FactoryGirl.create(:milestone, :project => current_project)
  1.upto(completed.to_i) { FactoryGirl.create(:completed_task, :project => current_project, :milestone => milestone) }
  1.upto(total.to_i - completed.to_i) { FactoryGirl.create(:task, :project => current_project, :milestone => milestone) }
end
