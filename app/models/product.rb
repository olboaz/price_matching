class Product < ApplicationRecord
    has_many :customers, through: :product_customer_price
    has_many :product_customer_prices, dependent: :destroy
    belongs_to :user
end
