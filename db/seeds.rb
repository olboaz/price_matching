# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(email: "ppastg92@free.fr", password: "1234567")
# puts "Users created"

require 'net/http'
require 'json'
source = "https://world.openfoodfacts.net/api/v2/product/8712566328208"
resp = Net::HTTP.get_response(URI.parse(source))
data = resp.body
result = JSON.parse(data)


# "product_name_fr_imported"=>"Magnum Glace Bâtonnet Amande 4x110ml",
# "product_quantity"=>"328"
# "quantity"=>"328 g",
# "serving_quantity"=>"110",
# "serving_size"=>"110ml",
# "brands"=>"Unilever",
# "brands_imported"=>"Magnum",
# "abbreviated_product_name_fr"=>"Magnum x4 amande",
# "abbreviated_product_name_fr_imported"=>"Magnum x4 amande",
# "image_url"=>"https://images.openfoodfacts.net/images/products/871/256/632/8208/front_en.120.400.jpg"


Product.create(
    short_name: result["product"]["product_name_fr"], 
    long_name: result["product"]["product_name_fr_imported"],
    quantity: result["product"]["quantity"],
    size: result["product"]["serving_size"],
    company: result["product"]["brands"],
    brand: result["product"]["brands_imported"],
    ean: result["code"], 
    categories: result["product"]["categories"]
)
puts "Products created"
