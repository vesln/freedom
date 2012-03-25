#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe CommentsController do
  describe 'POST create' do
    let(:comment) { double('Comment') }
    let(:task) { double('Task') }

    before do
      Comment.stub :new => comment
      comment.stub :save
      project = create :project, :id => 2
      controller.stub :current_task => task
      task.stub :new
      task.stub :comments
    end

    it "creates a new comment with the supplied data" do
      Comment.should_receive(:new).with 'data'
      post :create, :comment => 'data', :task_id => '1', :project_id => '2'
    end

    it "saves the comment" do
      comment.should_receive :save
      post :create, :comment => 'data', :task_id => '1', :project_id => '2'
    end

    it "redirects to the task page after save" do
      post :create, :task_id => '1', :project_id => '2'
      controller.should redirect_to(project_task_url('2', '1'))
    end
  end
end
