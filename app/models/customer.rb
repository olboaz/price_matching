class Customer < ApplicationRecord
    has_many :products, through: :product_customer_price
    has_many :product_customer_prices, dependent: :destroy
end
