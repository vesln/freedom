module Auth
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user
  end

  def login!(email, password)
    UserSession.new(:email => email, :password => password).save.should === true
  end
end

World(Auth)
