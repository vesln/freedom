# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

# Be sure to restart your server when you modify this file.

Freedom::Application.config.session_store :cookie_store, key: '_freedom_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Freedom::Application.config.session_store :active_record_store
