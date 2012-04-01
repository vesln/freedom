#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe TasksController do
  let(:tasks) { mock_model(Task) }
  let(:task) { mock_model(Task) }
  let(:project) { mock_model(Project) }

  before do
    controller.stub :current_project => project
    project.stub :tasks => tasks
  end

  describe 'GET index' do
    let(:completed) { completed = double('Completed tasks') }

    before do
      completed.stub :paginate
      tasks.stub :opened
      tasks.stub :completed => completed
    end

    it "assigns all open tasks for the current project" do
      tasks.stub(:opened => [task])
      get :index, :project_id => '1'
      assigns(:tasks).should eq [task]
    end

    it "assigns page of resolved tasks for the current project" do
      completed.should_receive(:paginate).with(:page => '2', :per_page => 15).and_return([task])
      get :index, :project_id => '1', :page => '2'
      assigns(:completed).should eq [task]
    end
  end

  describe 'GET new' do
    it "assigns a new task for the current project" do
      tasks.should_receive(:new).and_return(task)
      get :new, :project_id => '1'
      assigns(:task).should eq task
    end
  end

  describe 'POST create' do
    before do
      tasks.stub :new => task
      task.stub :save
      task.stub :user=
    end

    it "creates a new task with the supplied params" do
      tasks.should_receive(:new).with('data')
      post :create, :project_id => '1', :task => 'data'
    end

    it "saves the task" do
      task.should_receive(:save)
      post :create, :project_id => '1', :task => 'data'
    end

    it "assigns a new task for the current project" do
      tasks.should_receive(:new)
      post :create, :project_id => '1'
      assigns(:task).should eq task
    end

    it "sets the current user as a creator" do
      user = double('user')
      controller.stub :current_user => user
      task.should_receive(:user=).with(user)
      post :create, :project_id => '1'
    end

    describe 'with valid data' do
      it "redirects to the newly created task" do
        task.stub :save => true
        post :create, :project_id => project.id
        controller.should redirect_to(project_task_url(project, task))
      end
    end

    describe 'with invalid data' do
      it "renders the new template" do
        task.stub :save => false
        post :create, :project_id => project.id
        controller.should render_template('new')
      end
    end
  end

  describe 'GET show' do
    before do
      tasks.stub :find => task
    end

    it "fetches the requested task" do
      tasks.should_receive(:find).with('1')
      get :show, :id => '1'
    end

    it "assigns the requested task" do
      get :show, :id => '1'
      assigns(:task).should eq task
    end

    it "assigns a new comment for the current task" do
      comment = double("Comment")
      Comment.stub :new => comment
      get :show, :id => '1'
      assigns(:comment).should eql comment
    end
  end
end
