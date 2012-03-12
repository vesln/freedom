class SignupMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(:to => user.email, :subject => 'Welcome to Freedom', :from => 'noreply@example.com')
  end
end
