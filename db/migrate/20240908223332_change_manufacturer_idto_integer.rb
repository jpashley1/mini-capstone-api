class ChangeManufacturerIdtoInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :suppliers, :manufacturer_id, :integer
    add_column :products, :manufacturer_id, :integer
  end
end
