# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe MilestonesController do

  def valid_attributes
    attributes_for(:milestone)
  end
  
  before(:each) do
    @project = create(:project)
    @auth_user = create(:admin)
    sign_in @auth_user
    controller.stub(:current_project).and_return(@project)
  end
  
  describe "GET index" do
    it "assigns all milestones as @milestones" do
      milestone = Milestone.create! valid_attributes
      get :index, :project_id => @project.id
      assigns(:milestones).should eq([milestone])
    end
  end

  describe "GET show" do
    it "assigns the requested milestone as @milestone" do
      milestone = Milestone.create! valid_attributes
      get :show, {:id => milestone.to_param, :project_id => @project.id}
      assigns(:milestone).should eq(milestone)
    end
  end

  describe "GET new" do
    it "assigns a new milestone as @milestone" do
      get :new, :project_id => @project.id
      assigns(:milestone).should be_a_new(Milestone)
    end
  end

  describe "GET edit" do
    it "assigns the requested milestone as @milestone" do
      milestone = Milestone.create! valid_attributes
      get :edit, {:id => milestone.to_param, :project_id => @project.id}
      assigns(:milestone).should eq(milestone)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Milestone" do
        expect {
          post :create, {:milestone => valid_attributes, :project_id => @project.id}
        }.to change(Milestone, :count).by(1)
      end

      it "assigns a newly created milestone as @milestone" do
        post :create, {:milestone => valid_attributes, :project_id => @project.id}
        assigns(:milestone).should be_a(Milestone)
        assigns(:milestone).should be_persisted
      end

      it "redirects to the created milestone" do
        post :create, {:milestone => valid_attributes, :project_id => @project.id}
        response.should redirect_to project_milestone_url(@project, Milestone.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved milestone as @milestone" do
        Milestone.any_instance.stub(:save).and_return(false)
        post :create, {:milestone => {}, :project_id => @project.id,}
        assigns(:milestone).should be_a_new(Milestone)
      end

      it "re-renders the 'new' template" do
        Milestone.any_instance.stub(:save).and_return(false)
        post :create, {:milestone => {}, :project_id => @project.id}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested milestone" do
        milestone = Milestone.create! valid_attributes
        Milestone.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => milestone.to_param, :project_id => @project.id, :milestone => {'these' => 'params'}}
      end

      it "assigns the requested milestone as @milestone" do
        milestone = Milestone.create! valid_attributes
        put :update, {:id => milestone.to_param, :project_id => @project.id, :milestone => valid_attributes}
        assigns(:milestone).should eq(milestone)
      end

      it "redirects to the milestone" do
        milestone = Milestone.create! valid_attributes
        put :update, {:id => milestone.to_param, :project_id => @project.id, :milestone => valid_attributes}
        response.should redirect_to(project_milestone_url(@project, milestone))
      end
    end

    describe "with invalid params" do
      it "assigns the milestone as @milestone" do
        milestone = Milestone.create! valid_attributes
        Milestone.any_instance.stub(:save).and_return(false)
        put :update, {:id => milestone.to_param, :project_id => @project.id, :milestone => {}}
        assigns(:milestone).should eq(milestone)
      end

      it "re-renders the 'edit' template" do
        milestone = Milestone.create! valid_attributes
        Milestone.any_instance.stub(:save).and_return(false)
        put :update, {:id => milestone.to_param, :project_id => @project.id, :milestone => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested milestone" do
      milestone = Milestone.create! valid_attributes
      expect {
        delete :destroy, {:project_id => @project.id, :id => milestone.to_param}
      }.to change(Milestone, :count).by(-1)
    end

    it "redirects to the milestones list" do
      milestone = Milestone.create! valid_attributes
      delete :destroy, {:project_id => @project.id, :id => milestone.to_param}
      response.should redirect_to(project_milestones_url(@project.id))
    end
  end

end
