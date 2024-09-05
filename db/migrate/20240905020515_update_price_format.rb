class UpdatePriceFormat < ActiveRecord::Migration[7.1]

  # • Run rails test to make sure all tests are passing after making changes! (There may be some formatting issues with price as string vs number)
  def change
    # • Update the price attribute with the correct data-type. Be mindful of the correct number digits your type of products require.

    # Then, change the column type to decimal with precision and scale
    change_column :products, :price, :decimal, precision: 9, scale: 2
    #   Your description attribute may currently use the wrong data-type (string). Update it with the correct one if needed.
    change_column :products, :description, :text
    # • Add an attribute you can use to keep track of how many items you have in inventory for each product.
    add_column :products, :stock, :integer
  end
end
