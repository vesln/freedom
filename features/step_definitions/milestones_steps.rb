#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Given /^I am working on project "([^"]*)"$/ do |name|
  FactoryGirl.create(:project, :name => name)
end

Given 'There are few existing milestones for this project' do
  1.upto(5) do |i|
    FactoryGirl.create(:milestone, :name => i.to_s << '.0')
  end
end

Then 'I should see the milestones for the project' do
  1.upto(5) do |i|
    page.should have_content(i.to_s << '.0')
  end
end
