require 'sinatra'
require 'sinatra/flash'
require File.expand_path('../environment.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|model| require model }


# Use secret from env variable, and expire sessions after a year.
use Rack::Session::Cookie, expire_after: 31556926,
                           key: 'lincolnstore',
                           secret: ENV['SESSION_SECRET']

get '/' do
  @products = Product.all.limit(9)
  erb :index
end

# Admin Page
get '/admin' do
  authenticate
  @products = Product.all
  @orders = []
  erb :'admin/index'
end

get '/admin/products/:id/edit' do
  erb :'admin/products/edit'
end

get 'admin/products/new' do
  erb :'admin/products/new'
end

post '/admin/products/new' do
  redirect '/admin' if Product.create(params[:product])
end

# Products
get '/products/:id' do
  @product = Product.find(params[:id])
  erb :product
end

get '/volunteer' do
  erb :volunteer
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

def authenticate
  redirect '/' unless true
end
