require 'spec_helper'

describe MilestonesController do
  describe 'GET index' do
    it "assigns milestones for the current project as @milestones" do
      current_project = mock_model(Project, :id => 1)
      controller.stub(:current_project).and_return(current_project)
      milestones = [:milestone]
      Milestone.should_receive(:for_project).with(current_project).and_return(milestones)
      get :index, :project_id => '1'
      assigns(:milestones).should eql milestones
    end
  end
end
