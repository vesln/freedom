#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe ProjectsController do
  let (:project) { mock_model(Project) }

  describe 'GET index' do
    it "renders the index template" do
      get :index
      controller.should render_template :index
    end

    it "assigns all projects" do
      projects = [:project]
      Project.stub(:all).and_return(projects)
      get :index
      assigns(:projects).should eq projects
    end
  end

  describe 'GET new' do
    it "assigns a new project" do
      get :new
      assigns(:project).should be_a_new(Project)
    end
  end

  describe 'POST create' do
    before do
      project.stub(:save)
      Project.stub :new => project
    end

    it "creates a new project with the supplied params" do
      Project.should_receive(:new).with('data')
      project.should_receive(:save)
      post :create, :project => 'data'
    end

    it "assigns the new project" do
      post :create, :project => {}
      assigns(:project).should eq project
    end

    context "with valid data" do
      it "redirects to projects page" do
        project.stub(:save).and_return(true)
        post :create, :project => {}
        response.should redirect_to(projects_url)
      end
    end

    context "with invalid data" do
      it "renders the new template" do
        project.stub(:save).and_return(false)
        post :create, :project => {}
        controller.should render_template(:new)
      end
    end
  end

  describe 'GET edit' do
    it "assigns the requested project" do
      Project.should_receive(:find).with('1').and_return(project)
      get :edit, :id => '1'
      assigns(:project).should eq project
    end
  end

  describe 'PUT update' do
    before do
      Project.stub :find => project
    end

    it "assigns the requested project" do
      get :edit, :id => '1'
      assigns(:project).should eq project
    end

    it "updates the requested project" do
      Project.should_receive(:find).with('1').and_return(project)
      project.should_receive(:update_attributes).with('data')
      put :update, :id => 1, :project => 'data'
    end

    context 'with valid data' do
      it "redirects to projects" do
        project.stub :update_attributes => true
        put :update, :id => 1, :project => 'data'
        controller.should redirect_to(projects_url)
      end
    end

    context 'with invalid data' do
      it "renders the edit template" do
        project.stub :update_attributes => false
        put :update, :id => 1, :project => 'data'
        controller.should render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      Project.stub :find => project
    end

    it "deletes the requested project" do
      Project.should_receive(:find).with('1')
      project.should_receive(:destroy)
      delete :destroy, :id => '1'
    end

    it "redirects to projects" do
      delete :destroy, :id => '1'
      controller.should redirect_to(projects_url)
    end
  end
end
