require 'sinatra'
require 'sinatra/flash'
require 'active_record'
require 'dotenv'

Dotenv.load! unless ENV['RACK_ENV'] == 'production'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/lincolnstore')
enable :sessions

class Product < ActiveRecord::Base
end

get '/' do
  @products = Product.all.limit(9)
  erb :index
end

# Admin Page
get '/admin' do
  authenticate
  "Admin page"
end

# Products
get '/products/:id' do
  @product = Product.find(params[:id])
  erb :product
end

def authenticate
  redirect '/' unless true
end
