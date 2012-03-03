require 'spec_helper'

module Authentication
  describe SessionsController do
    describe "GET new" do
      it "assigns a new user_session as @user_session" do
        get :new
        assigns(:user_session).should be_a_new(UserSession)
      end
    end

    describe 'POST create' do
      context 'with valid data' do
        before do
          UserSession.any_instance.should_receive(:save).and_return(true)
        end

        it "creates a new user session" do
          post :create
        end

        it "redirects to dashboard" do
          post :create
          response.should redirect_to(dashboard_url)
        end
      end

      context "with invalid data" do
        before do
          UserSession.any_instance.should_receive(:save).and_return(false)
          post :create
        end

        it "renders the new template" do
          response.should render_template('new')
        end

        it "sets a flash error message" do
          flash[:error].should_not be_nil
        end
      end
    end
  end
end
