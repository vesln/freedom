# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe ProjectsController do

  def valid_attributes
    attributes_for(:project)
  end
  
  def sign_user!
    sign_in create(:user)
  end
  
  before(:each) do
    @auth_user = create(:admin)
    sign_in @auth_user
  end
  
  describe 'non-admin access' do
    it 'should restrict non-admins' do
      sign_user!
      get :index, {}
      response.should redirect_to('/')
    end
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      project = Project.create! valid_attributes
      get :index, {}
      assigns(:projects).should eq([project])
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      get :new, {}
      assigns(:project).should be_a_new(Project)
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :edit, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        post :create, {:project => valid_attributes}
        response.should redirect_to(Project.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => {}}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project" do
        project = Project.create! valid_attributes
        Project.any_instance.should_receive(:update_attributes).with({'name' => 'Bar foo'})
        put :update, {:id => project.to_param, :project => {'name' => 'Bar foo'}}
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}
        assigns(:project).should eq(project)
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}
        response.should redirect_to(project)
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => project.to_param, :project => {}}
        assigns(:project).should eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => project.to_param, :project => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, {:id => project.to_param}
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, {:id => project.to_param}
      response.should redirect_to(projects_url)
    end
  end

end
