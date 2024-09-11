class ChangeManufactuerToSupplier < ActiveRecord::Migration[7.1]
  def change

    rename_column :suppliers, :manufacturer_id, :supplier_id


  end
end
