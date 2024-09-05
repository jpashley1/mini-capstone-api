require "test_helper"

# class ProductsControllerTest < ActionDispatch::IntegrationTest
#   def index
#     @products = Product.all
#     # render "products/index"
#     render :index
#   end

#   def create
#     @product = Product.new(
#       name: params[:name],
#       price: params[:price],
#       image_url: params[:image_url],
#       description: params[:description],
#     )
#     @product.save
#     render :show
#   end

#   def show
#     # get the right id
#     @product = Product.find_by(id: params[:id])
#     # find the product with that id
#     render :show
#   end

#   def update
#     # find the correct product
#     @product = Product.find_by(id: params[:id])
#     # modify attributes
#     #
#     # what should i do if the param is nil? I want to not update that value
#     @product.update(
#       name: params[:name],
#       price: params[:price],
#       image_url: params[:image_url],
#       description: params[:description],
#       name: params[:name] || @product.name,
#       price: params[:price] || @product.price,
#       image_url: params[:image_url] || @product.image_url,
#       description: params[:description] || @product.description,
#     )
#     # save it
#     # render
#     render :show
#   end

#   def destroy
#     @product = Product.find_by(id: params[:id])
#     @product.destroy
#     render json: { message: "product has been removed" }
#   end
# end
