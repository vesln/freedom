#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe TasksController do
  describe 'GET index' do
    it "assigns all tasks for the current project" do
      tasks = mock_model(Task)
      task = mock_model(Task)
      project = mock_model(Project)
      controller.stub :current_project => project
      project.should_receive(:tasks).and_return(tasks)
      tasks.should_receive(:all).and_return([task])
      get :index, :project_id => '1'
      assigns(:tasks).should eql [task]
    end
  end
end
