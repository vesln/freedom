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

      it "creates a new user" do
        user.should_receive(:save)
        post :create
      end

      it "builds a new user with the supplied params" do
        User.should_receive(:new).with('data')
        post :create, :user => 'data'
      end

      it "assigns the user as @user" do
        post :create, {:user => {}}
        assigns(:user).should eql user
      end

      context 'with valid date' do
        it "renders the create template" do
          user.stub(:save).and_return(true)
          post :create, {:user => {}}
          response.should render_template('create')
        end
      end

      context "with invalid data" do
        it "renders the new template" do
          user.stub(:save).and_return(false)
          post :create, {:user => {}}
          response.should render_template('new')
        end
      end
    end
  end
end
