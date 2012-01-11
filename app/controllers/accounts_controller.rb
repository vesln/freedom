# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class AccountsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    @user = current_user
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to account_url, notice: 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
