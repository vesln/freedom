require 'spec_helper'

describe MilestonesController do
  let(:current_project) { current_project = mock_model(Project, :id => 1) }
  let(:project_id) { current_project.id }
  let(:milestone) { create(:milestone, :project_id => project_id) }

  before do
    controller.stub(:current_project).and_return(current_project)
  end

  describe 'GET index' do
    it "assigns milestones for the current project as @milestones" do
      milestones = [:milestone]
      Milestone.should_receive(:for_project).with(current_project).and_return(milestones)
      get :index, :project_id => '1'
      assigns(:milestones).should eql milestones
    end
  end

  describe 'GET new' do
    it "assigns new milestone as @milestone" do
      get :new, :project_id => '1'
      assigns(:milestone).should be_a_new(Milestone)
    end
  end

  describe 'POST create' do
    before do
      Milestone.stub :new => milestone
    end

    it "creates a new milestone with the supplied params" do
      Milestone.should_receive(:new).with('data')
      milestone.should_receive(:save)
      post :create, :project_id => project_id, :milestone => 'data'
    end

    it "sets the current project to the milestone" do
      milestone.should_receive(:project=).with(current_project)
      post :create, :project_id => project_id, :milestone => 'data'
    end

    it "assigns the milestone as @milestone" do
      post :create, :project_id => project_id, :milestone => 'data'
      assigns(:milestone).should eql milestone
    end

    context 'with valid data' do
      it "redirects to milestones page" do
        milestone.stub :save => true
        post :create, :project_id => project_id, :milestone => 'data'
        response.should redirect_to(project_milestones_url(current_project))
      end
    end

    context 'with invalid data' do
      it "renders the new template" do
        milestone.stub :save => false
        post :create, :project_id => project_id, :milestone => 'data'
        response.should render_template(:new)
      end
    end
  end
end
