# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe AccountsController do
  
  def valid_attributes
    {'email' => 'foo@example.com'}
  end
  
  before(:each) do
    @auth_user = create(:user)
    sign_in @auth_user
  end
  
  describe "GET edit" do
    it "assigns the current user as @user" do
      get :edit
      assigns(:user).should eq(@auth_user)
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.any_instance.should_receive(:update_attributes).with(valid_attributes)
        put :update, {:user => valid_attributes}
      end

      it "assigns the current user as @user" do
        put :update, {:user => valid_attributes}
        assigns(:user).should eq(@auth_user)
      end

      it "redirects to the account" do
        put :update, {:user => valid_attributes}
        response.should redirect_to(account_path)
      end
    end

    describe "with invalid params" do
      it "assigns the current user as @user" do
        put :update, {:user => {}}
        assigns(:user).should eq(@auth_user)
      end

      it "re-renders the 'edit' template" do
        User.any_instance.stub(:save).and_return(false)
        put :update, {:user => {}}
        response.should render_template("edit")
      end
    end
  end
  
end
