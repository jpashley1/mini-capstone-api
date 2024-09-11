class ChangeProductManufactuerToSupplier < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :manufacturer_id, :supplier_id

  end
end
