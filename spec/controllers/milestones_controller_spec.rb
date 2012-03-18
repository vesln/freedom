#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe MilestonesController do
  let(:current_project) { current_project = mock_model(Project, :id => 1) }
  let(:project_id) { current_project.id }
  let(:milestone) { create(:milestone, :project_id => project_id) }
  let(:milestones) { double('milestones') }

  before do
    controller.stub(:current_project).and_return(current_project)
    current_project.stub(:milestones).and_return(milestones)
    milestones.stub(:find).and_return(milestone)
  end

  describe 'GET index' do
    it "assigns milestones for the current project" do
      milestones.should_receive(:all).and_return([milestone])
      get :index
      assigns(:milestones).should eq [milestone]
    end
  end

  describe 'GET new' do
    it "assigns a new milestone" do
      get :new
      assigns(:milestone).should be_a_new(Milestone)
    end
  end

  describe 'POST create' do
    before do
      milestones.stub :new => milestone
    end

    it "creates a new milestone with the supplied params" do
      milestones.should_receive(:new).with('data')
      milestone.should_receive(:save)
      post :create, :milestone => 'data'
    end

    it "assigns the new milestone" do
      post :create, :project_id => project_id
      assigns(:milestone).should eq milestone
    end

    context 'with valid data' do
      it "redirects to milestones page" do
        milestone.stub :save => true
        post :create, :project_id => project_id
        response.should redirect_to(project_milestones_url(current_project))
      end
    end

    context 'with invalid data' do
      it "renders the new template" do
        milestone.stub :save => false
        post :create, :project_id => project_id
        response.should render_template(:new)
      end
    end
  end

  describe 'GET edit' do
    it "assign the requested milestone" do
      milestones.should_receive(:find).with('1').and_return(milestone)
      get :edit, :project_id => project_id, :id => '1'
      assigns(:milestone).should eq milestone
    end
  end

  describe 'PUT update' do
    it "assigns the requested milestone" do
      milestones.should_receive(:find).with('1')
      milestone.stub :update_attributes => false
      put :update, :project_id => project_id, :id => '1', :milestone => 'data'
    end

    it "updates the requested milestone" do
      milestone.should_receive(:update_attributes).with('data')
      put :update, :project_id => project_id, :id => '1', :milestone => 'data'
    end

    context 'with valid data' do
      it "redirects to milestones" do
        milestone.stub :update_attributes => true
        put :update, :project_id => project_id, :id => '1', :milestone => 'data'
        controller.should redirect_to(project_milestones_url(current_project))
      end
    end

    context 'with invalid data' do
      it "renders the edit template" do
        milestone.stub :update_attributes => false
        put :update, :project_id => project_id, :id => '1', :milestone => 'data'
        controller.should render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    it "deletes the requested milestone" do
      milestones.should_receive(:find).with('1')
      milestone.should_receive(:destroy)
      delete :destroy, :project_id => project_id, :id => '1'
    end

    it "redirects to milestones" do
      delete :destroy, :project_id => project_id, :id => '1'
      controller.should redirect_to(project_milestones_url(current_project))
    end
  end
end
