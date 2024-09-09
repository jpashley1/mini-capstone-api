class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render "products/index"
    # render json: @products
    # ask why this doesn't work: render :index
    render :index

    # # testing route code:
    # render json: { message: "index" }
  end

  def show
    # get the right id
    @product = Product.find_by(id: params[:id])
    # find the product with that id
    # ask why this doesn't work:
    render :show
    # ask why the singular versus plural, is ruby just smart, or am I missing a key peice of logic regarding the convention
    # render json: @product
    # # testing route code:
    # render json: { message: "Show" }
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      stock: params[:stock],
      manufacturer_id: params[:manufacturer_id]

    )
    #happy sad path
    if @product.save
      render :show
    else
      #error handling
      render json: { errors: @product.errors.full_messages}, 
      status: :unprocessable_entity
    end

  end

  def update
    # find the correct product
    @product = Product.find_by(id: params[:id])
    # modify attributes
    #
    # what should i do if the param is nil? I want to not update that value
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
      stock: params[:stock] || @product.stock,
      manufacturer_id: params[:manufacturer_id] || @product.stock,
    )
    # render json: @product
    # # testing route code:
    render :show
    # render json: { message: "update" }
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "product has been removed" }
    # # testing route code:
    # render json: { message: "destroy" }
  end

  # def handle_root_not_found
  #   render json: { message: "route not found" }, status: 404
  # end
end
