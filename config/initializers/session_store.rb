# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_filesender_session',
  :secret      => '5f55121ca3b0076d9e2ec9124ad711102b09c70fe676745a411f6b571e2f82e69a2c8539a5c599ce8820bc9bcfa2a17335d14c6750fce297a4b82c926bde8cf8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
