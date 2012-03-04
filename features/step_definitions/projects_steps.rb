Given /^There are project called "([^"]*)"$/ do |name|
  FactoryGirl.create(:project, :name => name)
end
