module Authentication
  class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      unless @user.save
        flash.now[:error] = 'Please, try again.'
        render 'new'
      end
    end
  end
end
