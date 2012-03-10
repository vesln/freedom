module Auth
  def current_user=(user)
    puts 'current get called'
    @current_user = user
  end

  def current_user
    @current_user
  end
end

World(Auth)
