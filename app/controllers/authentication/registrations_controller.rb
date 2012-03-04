module Authentication
  class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      render 'new' unless @user.save
    end
  end
end
