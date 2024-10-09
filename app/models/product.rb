class Product < ApplicationRecord
  # Name - presence - uniqueness
  validates :name, uniqueness: true
  validates :name, presence: true
  # Price - presence - numericality and not a negative number or 0
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Description - length of a minimum of 1 and a maximum of 500 characters
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  # def categories
  #   categories = []
  #   category_products = CategoryProduct.where(product_id: id)
  #   category_products.each do |cp|
  #     categories << Category.find_by(id: cp.category)
  #   end
  # end

  # de f supplier
  #   Supplier.find_by(id: supplier.id)
  # end

  def tax
    @product.price * 0.15 #ask about this syntax
  end

  def images_with_default
    if images.length > 0
      return images
    else
      return [
        {id: 100, url: "https://media.gq.com/photos/5582f8c409f0bee56440b484/master/pass/entertainment-2011-05-cage-match-nic-cage_300x430.jpg", created_at: Time.now, updated_at: Time.now}
      ]
    end
  end
end
