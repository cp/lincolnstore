require 'active_record'
require 'dotenv'

Dotenv.load! unless ENV['RACK_ENV'] == 'production'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/lincolnstore')
