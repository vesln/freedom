module Authentication
  class SessionsController < ApplicationController
    def new
      @user_session = UserSession.new
    end

    def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        redirect_to dashboard_url
      else
        flash.now[:error] = 'Sorry, please try again.'
        render 'new'
      end
    end
  end
end
