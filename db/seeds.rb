ProductCustomerPrice.destroy_all
Product.destroy_all
Customer.destroy_all
User.destroy_all
puts "All destroy"

User.create(email: "price@com.com", password: "1234567")
puts "Users created"

require 'net/http'
require 'json'
source = "https://world.openfoodfacts.net/api/v2/product/8712566328208"
resp = Net::HTTP.get_response(URI.parse(source))
data = resp.body
result = JSON.parse(data)

## Exemple extraction Open Food Fact
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


p = Product.create(
    short_name: result["product"]["product_name_fr"], 
    long_name: result["product"]["product_name_fr_imported"],
    quantity: result["product"]["quantity"],
    size: result["product"]["serving_size"],
    company: result["product"]["brands"],
    brand: result["product"]["brands_imported"],
    ean: result["code"], 
    categories: result["product"]["categories"],
    user_id: User.first.id
)
puts "Products created"

c = Customer.create(name: "Casino")
puts "Customers created"

ProductCustomerPrice.create(product_id: p.id, customer_id: c.id, price: 2.45, date: DateTime.now)
puts "Price created"

customer_list_full = %w[
    8\ à\ Huit
    Action
    Aldi
    Atoo
    Auchan
    Auchan\ Supermarché
    B&M
    Babou
    Bi1
    Bio\ c'bon
    Biocoop
    Biomonde
    Carrefour
    Carrefour\ Bio
    Carrefour\ City
    Carrefour\ Contact
    Carrefour\ Express
    Carrefour\ Market
    Carrefour\ Montagne
    Casino\ #HyperFrais
    Casino\ #ToutPrès
    Casino\ Shop
    Casino\ Supermarchés
    Centrakor
    Coccimarket
    Coccinelle
    Colruyt
    Coop
    Cora
    Croc'Nature
    Diagonal
    Discount
    E.Leclerc
    E.Leclerc\ Bio
    E.Leclerc\ express
    Écomiam
    Franprix
    Gifi
    Grand\ Frais
    Grand\ Panier\ Bio
    Hyper\ U
    Intermarché\ Contact
    Intermarché\ Express
    Intermarché\ Hyper
    Intermarché\ Super
    KLO
    La\ Foir'Fouille
    La\ Vie\ claire
    La\ Vie\ Saine
    L'Atelier\ Fermier
    Le\ Petit\ Casino
    Leader\ Price
    L'Eau\ Vive
    Les\ Comptoirs\ de\ la\ Bio
    Lidl
    Magasin Biologique
    Marché\ aux\ Affaires
    Marché\ d’à\ coté
    Match
    Maximarché
    Monop'
    Monoprix
    My\ Auchan
    Naturalia
    NaturéO
    Netto
    Norma
    Noz
    Picard
    Proxi
    Proximarché
    Satoriz
    Sherpa
    Sitis
    So\ Bio
    Soft-discount
    SPAR
    Stokomani
    Supeco
    Super\ U
    Supermarché\ Match
    Supermarchés\ G20
    Supermarchés\ Sitis
    Thiriet
    U\ express
    Utile
    Vival
    Viveco
    Votre\ Marché    
]

customer_list_short  = %w[
    8\ à\ Huit
    Action
    Aldi
    Atoo
    Auchan
    B&M
    Babou
    Bi1
    Bio\ c'bon
    Biocoop
    Biomonde
    Carrefour
    Casino
    Centrakor
    Coccimarket
    Coccinelle
    Colruyt
    Coop
    Cora
    Croc'Nature
    Diagonal
    Discount
    E.Leclerc
    Écomiam
    Franprix
    Gifi
    Grand\ Frais
    Grand\ Panier\ Bio
    Hyper\ U
    Intermarché
    KLO
    La\ Foir'Fouille
    La\ Vie\ claire
    La\ Vie\ Saine
    L'Atelier\ Fermier
    Le\ Petit\ Casino
    Leader\ Price
    L'Eau\ Vive
    Les\ Comptoirs\ de\ la\ Bio
    Lidl
    Magasin Biologique
    Marché\ aux\ Affaires
    Marché\ d’à\ coté
    Match
    Maximarché
    Monoprix
    Naturalia
    NaturéO
    Netto
    Norma
    Noz
    Picard
    Proxi
    Satoriz
    Sherpa
    Sitis
    So\ Bio
    Soft-discount
    SPAR
    Stokomani
    Supeco
    Super\ U
    Supermarché\ Match
    Supermarchés\ G20
    Supermarchés\ Sitis
    Thiriet
    U\ express
    Utile
    Vival
    Viveco
    Votre\ Marché    
]