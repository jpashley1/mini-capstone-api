class ChangeImageProductReferences < ActiveRecord::Migration[7.1]
  def change
    change_column :images, :product_id, :integer

  end
end
