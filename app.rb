require 'sinatra'
require 'sinatra/flash'
require File.expand_path('../environment.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|model| require model }
enable :sessions

get '/' do
  @products = Product.all.limit(9)
  erb :index
end

# Admin Page
get '/admin' do
  authenticate
  erb :'admin/index'
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
