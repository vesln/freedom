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

describe IssuesController do

  def valid_attributes
    attributes_for(:issue)
  end
  
  before(:each) do
    @project = create(:project)
    @auth_user = create(:admin)
    sign_in @auth_user
  end
  
  describe "GET index" do
    it "assigns all issues as @issues" do
      issue = Issue.create! valid_attributes
      get :index, {:project_id => @project.id}
      assigns(:issues).should eq([issue])
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      issue = Issue.create! valid_attributes
      get :show, {:id => issue.to_param, :project_id => @project.id}
      assigns(:issue).should eq(issue)
    end
  end

  describe "GET new" do
    it "assigns a new issue as @issue" do
      get :new, {:project_id => @project.id}
      assigns(:issue).should be_a_new(Issue)
    end
  end

  describe "GET edit" do
    it "assigns the requested issue as @issue" do
      issue = Issue.create! valid_attributes
      get :edit, {:id => issue.to_param, :project_id => @project.id}
      assigns(:issue).should eq(issue)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, {:issue => valid_attributes, :project_id => @project.id}
        }.to change(Issue, :count).by(1)
      end

      it "assigns a newly created issue as @issue" do
        post :create, {:issue => valid_attributes, :project_id => @project.id}
        assigns(:issue).should be_a(Issue)
        assigns(:issue).should be_persisted
      end

      it "redirects to the created issue" do
        post :create, {:issue => valid_attributes, :project_id => @project.id}
        response.should redirect_to([@project, Issue.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => {}, :project_id => @project.id}
        assigns(:issue).should be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => {}, :project_id => @project.id}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested issue" do
        issue = Issue.create! valid_attributes
        Issue.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => issue.to_param, :issue => {'these' => 'params'}, :project_id => @project.id}
      end

      it "assigns the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        put :update, {:id => issue.to_param, :issue => valid_attributes, :project_id => @project.id}
        assigns(:issue).should eq(issue)
      end

      it "redirects to the issue" do
        issue = Issue.create! valid_attributes
        put :update, {:id => issue.to_param, :issue => valid_attributes, :project_id => @project.id}
        response.should redirect_to([@project, issue])
      end
    end

    describe "with invalid params" do
      it "assigns the issue as @issue" do
        issue = Issue.create! valid_attributes
        Issue.any_instance.stub(:save).and_return(false)
        put :update, {:id => issue.to_param, :issue => {}, :project_id => @project.id}
        assigns(:issue).should eq(issue)
      end

      it "re-renders the 'edit' template" do
        issue = Issue.create! valid_attributes
        Issue.any_instance.stub(:save).and_return(false)
        put :update, {:id => issue.to_param, :issue => {}, :project_id => @project.id}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested issue" do
      issue = Issue.create! valid_attributes
      expect {
        delete :destroy, {:id => issue.to_param, :project_id => @project.id}
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      issue = Issue.create! valid_attributes
      delete :destroy, {:id => issue.to_param, :project_id => @project.id}
      response.should redirect_to(project_issues_url)
    end
  end

end
