class AccountsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user], :as => :registered)
    render 'edit'
  end
end
