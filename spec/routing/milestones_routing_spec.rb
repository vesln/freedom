# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require "spec_helper"

describe MilestonesController do
  describe "routing" do

    it "routes to #index" do
      get("/projects/1/milestones").should route_to("milestones#index", :project_id => "1")
    end

    it "routes to #new" do
      get("/projects/1/milestones/new").should route_to("milestones#new", :project_id => "1")
    end

    it "routes to #show" do
      get("/projects/1/milestones/1").should route_to("milestones#show", :id => "1", :project_id => "1")
    end

    it "routes to #edit" do
      get("/projects/1/milestones/1/edit").should route_to("milestones#edit", :id => "1", :project_id => "1")
    end

    it "routes to #create" do
      post("/projects/1/milestones").should route_to("milestones#create", :project_id => "1")
    end

    it "routes to #update" do
      put("/projects/1/milestones/1").should route_to("milestones#update", :id => "1", :project_id => "1")
    end

    it "routes to #destroy" do
      delete("/projects/1/milestones/1").should route_to("milestones#destroy", :id => "1", :project_id => "1")
    end

  end
end
