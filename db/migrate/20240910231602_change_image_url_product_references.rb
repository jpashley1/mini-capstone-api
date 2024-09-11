class ChangeImageUrlProductReferences < ActiveRecord::Migration[7.1]
  def change
    change_column :images, :product_id, :text
  end
end
