#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

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

  def register(user)
    fill_in 'Name', :with => user.name
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    fill_in 'Password confirmation', :with => user.password_confirmation || user.password
    click_on 'Sign up'
  end
end

World(Auth)
