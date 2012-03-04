Given /^There are a project called "([^"]*)"$/ do |name|
  FactoryGirl.create(:project, :name => name)
end
