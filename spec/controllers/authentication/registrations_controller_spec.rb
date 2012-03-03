require 'spec_helper'

module Authentication
  describe RegistrationsController do
    describe "GET new" do
      it "assigns a new user as @user" do
        get :new, {}
        assigns(:user).should be_a_new(User)
      end
    end

    describe 'POST create' do
      let(:user) { mock_model(User) }

      before do
        User.stub :new => user
        user.stub :save
      end

      context 'with valid date' do
        it "creates a new user" do
          user.should_receive(:save)
          post :create
        end

        it "builds a new user with the supplied params" do
          User.should_receive(:new).with('data')
          post :create, :user => 'data'
        end

        it "renders the create template" do
          user.stub(:save).and_return(true)
          post :create, {:user => {}}
          response.should render_template('create')
        end
      end

      context "with invalid data" do
        before do
          user.stub(:save).and_return(false)
          post :create, {:user => {}}
        end

        it "renders the new template" do
          response.should render_template('new')
        end

        it "assings the unsaved user as @user" do
          assigns(:user).should eql user
        end

        it "sets a flash error message" do
          flash[:error].should_not be_nil
        end
      end
    end
  end
end
