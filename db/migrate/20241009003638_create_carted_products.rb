class CreateCartedProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :carted_products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.references :order, foreign_key: true # This allows null values
      t.string :status # You can define what statuses are allowed

      t.timestamps
    end
  end
end
