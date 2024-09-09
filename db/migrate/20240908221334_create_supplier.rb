class CreateSupplier < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
      t.string :manufacturer_id

      t.timestamps
    end
  end
end
