#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

module Authentication
  class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new params[:user]

      unless @user.save
        render :new
      end
    end
  end
end
