require 'spec_helper'

describe AccountsController do
  let(:user) { mock_model(User) }

  describe 'GET edit' do
    it "assigns the current user as @user" do
      controller.stub :current_user => user
      get :edit
      assigns(:user).should eql user
    end
  end

  describe 'PUT update' do
    it "updates the current user" do
      controller.should_receive(:current_user).and_return(user)
      user.should_receive(:update_attributes).with('data', :as => :registered)
      put :update, :user => 'data'
    end

    it "renders the edit template" do
      user.stub :update_attributes
      controller.stub :current_user => user
      put :update, :user => 'data'
      response.should render_template(:edit)
    end
  end
end
