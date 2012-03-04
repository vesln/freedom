require 'spec_helper'

describe Milestone do
  it { should belong_to :project }
  it { should validate_presence_of :name }

  describe 'for_project' do
    it "return all milestones for a requested project" do
      project = create(:project, :id => 1)
      expected = create(:milestone, :project_id => project.id)
      unexpected = create(:milestone, :project_id => 2)
      Milestone.for_project(project).should == [expected]
    end
  end
end
