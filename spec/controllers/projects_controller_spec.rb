require 'spec_helper'

describe ProjectsController do
  describe 'GET index' do
    it "renders the index template" do
      get :index
      controller.should render_template :index
    end

    it "assigns all projects as @projects" do
      projects = [:project]
      Project.stub(:all).and_return(projects)
      get :index
      assigns(:projects).should eql projects
    end
  end

  describe 'GET new' do
    it "renders the new template" do
      get :new
      controller.should render_template :new
    end

    it "assigns new project to @project" do
      get :new
      assigns(:project).should be_a_new(Project)
    end
  end

  describe 'POST create' do
    let (:project) { mock_model(Project) }

    before do
      project.stub(:save)
      Project.stub :new => project
    end

    it "builds a project with the supplied params" do
      Project.should_receive(:new).with('data')
      post :create, :project => 'data'
    end

    it "creates a new project" do
      project.should_receive(:save)
      post :create, :project => {}
    end

    context "with valid data" do
      it "redirects to projects page" do
        project.stub(:save).and_return(true)
        post :create, :project => {}
        response.should redirect_to(projects_url)
      end
    end

    context "with invalid data" do
      before do
        project.stub(:save).and_return(false)
      end

      it "assigns the unsaved project as @project" do
        post :create, :project => {}
        assigns(:project).should eql project
      end

      it "renders the new template" do
        post :create, :project => {}
        controller.should render_template(:new)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:project) { project = mock_model(Project) }

    before do
      Project.stub(:find).and_return(project)
    end

    it "finds the requested project" do
      Project.should_receive(:find).with('1').and_return(project)
      delete :destroy, :id => '1'
    end

    it "deletes the requested project" do
      project.should_receive(:destroy)
      delete :destroy, :id => '1'
    end

    it "redirects to projects" do
      delete :destroy, :id => '1'
      controller.should redirect_to(projects_url)
    end
  end
end
