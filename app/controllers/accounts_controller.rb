#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class AccountsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes! params[:user], :as => :registered
    render :edit
  end
end
