#--
# Freedom - Mind-blowing issue tracker.
#
# Copyright (c) 2012 Veselin Todorov <hi@vesln.com>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require 'spec_helper'

describe UsersProjectsController do

  def valid_attributes
    attributes_for(:users_project)
  end
  
  before(:each) do
    @project = create(:project)
    @auth_user = create(:admin)
    sign_in @auth_user
  end
  
  describe "GET index" do
    it "assigns all users_projects as @users_projects" do
      user = create(:user)
      attrs = valid_attributes.merge({:user_id => user.id, :project_id => @project.id})
      user_project = UsersProject.create! attrs
      get :index, {:project_id => @project.id}
      expected = User.includes(:users_projects).where(['users_projects.project_id = ?', @project.id]).all
      assigns(:users).should eq(expected)
    end
  end

  describe "GET new" do
    it "assigns a new users_project as @users_project" do
      get :new, {:project_id => @project.id}
      assigns(:users_project).should be_a_new(UsersProject)
    end
  end

  describe "GET edit" do
    it "assigns the requested users_project as @users_project" do
      users_project = UsersProject.create! valid_attributes
      get :edit, {:project_id => @project.id, :id => users_project.to_param}
      assigns(:users_project).should eq(users_project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new UsersProject" do
        expect {
          post :create, {:project_id => @project.id, :users_project => valid_attributes}
        }.to change(UsersProject, :count).by(1)
      end

      it "assigns a newly created users_project as @users_project" do
        post :create, {:project_id => @project.id, :users_project => valid_attributes}
        assigns(:users_project).should be_a(UsersProject)
        assigns(:users_project).should be_persisted
      end

      it "redirects to the created users_project" do
        post :create, {:project_id => @project.id, :users_project => valid_attributes}
        response.should redirect_to(project_users_projects_url(@project.id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved users_project as @users_project" do
        UsersProject.any_instance.stub(:save).and_return(false)
        post :create, {:project_id => @project.id, :users_project => {}}
        assigns(:users_project).should be_a_new(UsersProject)
      end

      it "re-renders the 'new' template" do
        UsersProject.any_instance.stub(:save).and_return(false)
        post :create, {:project_id => @project.id, :users_project => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested users_project" do
        users_project = UsersProject.create! valid_attributes
        UsersProject.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:project_id => @project.id, :id => users_project.to_param, :users_project => {'these' => 'params'}}
      end

      it "assigns the requested users_project as @users_project" do
        users_project = UsersProject.create! valid_attributes
        put :update, {:project_id => @project.id, :id => users_project.to_param, :users_project => valid_attributes}
        assigns(:users_project).should eq(users_project)
      end

      it "redirects to the users_project" do
        users_project = UsersProject.create! valid_attributes
        put :update, {:project_id => @project.id, :id => users_project.to_param, :users_project => valid_attributes}
        response.should redirect_to(project_users_projects_url(@project.id))
      end
    end

    describe "with invalid params" do
      it "assigns the users_project as @users_project" do
        users_project = UsersProject.create! valid_attributes
        UsersProject.any_instance.stub(:save).and_return(false)
        put :update, {:project_id => @project.id, :id => users_project.to_param, :users_project => {}}
        assigns(:users_project).should eq(users_project)
      end

      it "re-renders the 'edit' template" do
        users_project = UsersProject.create! valid_attributes
        UsersProject.any_instance.stub(:save).and_return(false)
        put :update, {:project_id => @project.id, :id => users_project.to_param, :users_project => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested users_project" do
      users_project = UsersProject.create! valid_attributes
      expect {
        delete :destroy, {:project_id => @project.id, :id => users_project.to_param}
      }.to change(UsersProject, :count).by(-1)
    end

    it "redirects to the users_projects list" do
      users_project = UsersProject.create! valid_attributes
      delete :destroy, {:project_id => @project.id, :id => users_project.to_param}
      response.should redirect_to(project_users_projects_url(@project.id))
    end
  end

end
