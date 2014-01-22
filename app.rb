require 'sinatra'
require 'sinatra/flash'
require File.expand_path('../environment.rb', __FILE__)
require File.expand_path('../models/product.rb', __FILE__)

# Use secret from env variable, and expire sessions after a year.
use Rack::Session::Cookie, expire_after: 31556926,
                           key: 'lincolnstore',
                           secret: ENV['SESSION_SECRET']

get '/' do
  @products = Product.all.limit(9).reverse_order
  erb :index
end

# Admin Page
get '/admin' do
  authenticate
  @products = Product.all
  erb :'admin/index'
end

get '/admin/products/:id/delete' do
  authenticate
  product = Product.find(params[:id])

  if product.destroy
    flash[:success] = "#{product.name} has been removed."
    redirect '/admin'
  else
    flash[:error] = "Failed while trying to remove #{product.name}."
    redirect '/admin'
  end
end

get '/admin/products/new' do
  authenticate
  erb :'admin/products/new'
end

post '/admin/products/new' do
  authenticate
  product = Product.create! do |p|
    p.name        = params[:name]
    p.description = params[:description]
    p.image_url   = params[:image_url]
    p.price       = params[:price]
  end

  redirect "/products/#{product.id}"
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
