class BackdoorLoginController < ApplicationController
  def login
    raise "500" unless Rails.env.test?
    user = User.find_by_email!(params[:email])
    UserSession.new(user).save
    render :nothing => true
  end
end
