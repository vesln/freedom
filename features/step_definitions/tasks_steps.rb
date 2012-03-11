#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Given /^the following tasks exist:$/ do |table|
  table.hashes.each do |row|
    user = User.find_by_name(row['assigned_user']) || FactoryGirl.create(:user, :name => row['assigned_user'])
    milestone = Milestone.find_by_name(row['milestone']) || FactoryGirl.create(:milestone, :name => row['milestone'], :project_id => current_project.id)
    attributes = {
      :title => row['title'],
      :state => row['state'],
      :assigned_user_id => user.id,
      :milestone_id => milestone.id,
      :project_id => current_project.id
    }
    FactoryGirl.create(:task, attributes)
  end
end

Then /^I should see the following tasks:$/ do |table|
  table.hashes.each do |row|
    row.each do |_, value|
      page.should have_content(value)
    end
  end
end

Given /^the milestone "([^"]*)" exist$/ do |name|
  FactoryGirl.create(:milestone, :name => name, :project_id => current_project.id)
end

Given /^the user "([^"]*)" exist$/ do |name|
  FactoryGirl.create(:user, :name => name)
end

Given /^I submit the following task information:$/ do |table|
  fields = table.rows_hash
  fill_in 'Title', :with => fields['title']
  select fields['state'], :from => 'State'
  select fields['milestone'], :from => 'Milestone'
  select fields['assigned_user'], :from => 'Who is responsible?'
  click_button 'Save'
end

Then /^I should see the following task:$/ do |table|
  table.rows_hash.each_value do |value|
    page.should have_content(value)
  end
end
