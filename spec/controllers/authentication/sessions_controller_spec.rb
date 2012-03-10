require 'spec_helper'

module Authentication
  describe UserSessionsController do
    describe "GET new" do
      it "assigns a new user_session" do
        get :new
        assigns(:user_session).should be_a_new(UserSession)
      end
    end

    describe 'POST create' do
      let (:user_session) { double('user_sesion') }

      before do
        user_session.stub(:save).and_return(true)
        UserSession.stub(:new).and_return(user_session)
      end

      it "assigns the new user session" do
        post :create
        assigns(:user_session).should eql user_session
      end

      it "creates a new user session" do
        user_session.should_receive(:save).and_return(true)
        post :create
      end

      it "creates build a new user session with the supplied params" do
        UserSession.should_receive(:new).with('data')
        post :create, {:user_session => 'data'}
      end

      context 'with valid data' do
        it "redirects to dashboard" do
          post :create
          response.should redirect_to(dashboard_url)
        end
      end

      context "with invalid data" do
        it "renders the new template" do
          user_session.stub(:save).and_return(false)
          post :create
          response.should render_template('new')
        end
      end
    end

    describe 'DELETE destroy' do
      let(:user_session) { double(:user_session) }

      before do
        user_session.should_receive(:destroy)
        controller.stub(:current_user_session).and_return(user_session)
      end

      it "logouts the current user" do
        delete :destroy
      end

      it "redirects to login page" do
        delete :destroy
        response.should redirect_to(new_user_session_url)
      end

      it "sets a flash notice" do
        delete :destroy
        flash[:notice].should_not be_nil
      end
    end
  end
end
