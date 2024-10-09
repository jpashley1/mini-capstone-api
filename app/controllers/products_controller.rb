class ProductsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:update]
  # skip_before_action :protect_from_forgery

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
      description: params[:description],
      stock: params[:stock],
      supplier_id: params[:supplier_id]
    )
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
    )
    # if params[:images].present?
    #   params[:images].each do |image_url|
    #     @product.images.build(url: image_url)
    #   end
    # end
    #happy sad path
    if @product.save!
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
      description: params[:description] || @product.description,
      stock: params[:stock] || @product.stock,
      supplier_id: params[:supplier_id] || @product.stock,
    )
    @product.save!
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
