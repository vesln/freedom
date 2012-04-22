#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

module Authentication
  class UserSessionsController < ApplicationController
    def new
      @user_session = UserSession.new
    end

    def create
      @user_session = UserSession.new params[:user_session]

      if @user_session.save
        redirect_to dashboard_url
      else
        render :new
      end
    end

    def destroy
      current_user_session.destroy
      redirect_to sign_in_url, :notice => 'Successful logout'
    end
  end
end
