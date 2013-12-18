require File.expand_path('../environment.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|model| require model }

# This script is to be ran outside of the app, and only in development.
# It sets everything up with dummy examples so that we can get a good picture
# of what a production site will look like.

products = [
  {
    name:        'White Hoodie',
    description: 'A simple white hoodie',
    img_url:     'http://c-product.images.sportsfanshop.jcpenney.com/32-23/32-23404-Y.jpg',
    price:       2000
  },
  {
    name:        'Hat',
    description: 'Simple Lincoln red hat',
    img_url:     'http://www.cardinalsgab.com/wp-content/uploads/2012/08/Cardinals.jpg',
    price:       1500
  },
  {
    name:        'T Shirt',
    description: 'Dark red Cardinals T-Shirt',
    img_url:     'http://cardinals.seenon.com/imgcache/product/resized/000/370/487/catl/00370487-439588_500.jpg?k=86b296e2&pid=370487&s=catl&sn=cardinals',
    price:       2500
  },
  {
    name:        'White T-Shirt',
    description: 'White Cardinals T-Shirt',
    img_url:     'http://www.fornfl.com/images/2014nfl/T-Shirts/Arizona%20Cardinals/Nike_Arizona_Cardinals_Womens_Legend_Logo_Dri_FIT_NFL_T_Shirt___White.jpg',
    price:       3000
  }
]

products.each do |p|
  Product.create(name: p[:name], description: p[:description], image_url: p[:img_url], price: p[:price])
  puts "Created #{p[:name]}"
end
