class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :short_name
      t.string :long_name
      t.string :quantity
      t.string :size
      t.string :company
      t.string :brand
      t.string :ean
      t.string :categories

      t.timestamps
    end
  end
end
