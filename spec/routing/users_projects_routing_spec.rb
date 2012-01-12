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

require "spec_helper"

describe UsersProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/projects/1/users_projects").should route_to("users_projects#index", :project_id => "1")
    end

    it "routes to #new" do
      get("/projects/1/users_projects/new").should route_to("users_projects#new", :project_id => "1")
    end

    it "routes to #edit" do
      get("/projects/1/users_projects/1/edit").should route_to("users_projects#edit", :id => "1", :project_id => "1")
    end

    it "routes to #create" do
      post("/projects/1/users_projects").should route_to("users_projects#create", :project_id => "1")
    end

    it "routes to #update" do
      put("/projects/1/users_projects/1").should route_to("users_projects#update", :id => "1", :project_id => "1")
    end

    it "routes to #destroy" do
      delete("/projects/1/users_projects/1").should route_to("users_projects#destroy", :id => "1", :project_id => "1")
    end

  end
end
