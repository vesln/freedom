#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'rubygems'
require 'spork'

Spork.prefork do
end

Spork.each_run do
  FactoryGirl.reload
  Freedom::Application.reload_routes!
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Factory::Syntax::Methods
  config.include EmailSpec::Helpers, type: :mailer
  config.include EmailSpec::Matchers, type: :mailer
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
end
