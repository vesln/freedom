# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class User < ActiveRecord::Base
  # Devise configurations.
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for the model.
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  
  # Checks if user is admin.
  def is_admin?
    admin
  end
end
