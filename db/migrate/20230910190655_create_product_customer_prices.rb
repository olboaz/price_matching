class CreateProductCustomerPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :product_customer_prices do |t|
      t.float :price, :default => '0.00'
      t.datetime :date
      t.references :product, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
