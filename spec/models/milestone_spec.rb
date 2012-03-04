require 'spec_helper'

describe Milestone do
  describe 'for_project' do
    it "return all milestones for a requested project" do
      project = FactoryGirl.create(:project, :id => 1)
      expected = FactoryGirl.create(:milestone, :project_id => project.id)
      unexpected = FactoryGirl.create(:milestone, :project_id => 2)
      Milestone.for_project(project).should == [expected]
    end
  end
end
