# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Wigtraq_session',
  :secret      => '5dc902829e0381340b10087a1f3b4f8ae3c5ff10e92040df444b3f23b5f2842da47b4802bafa5272694b1372e9b08350079386d255745e0bb33face7511bff97'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
