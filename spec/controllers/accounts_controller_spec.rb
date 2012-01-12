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
