# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe DashboardsController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.code.should == "302"
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "GET 'index' with logged user" do
    it "returns http success" do
      sign_in create(:user)
      get 'index'
      response.should be_success
    end
  end
end
