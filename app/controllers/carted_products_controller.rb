class CartedProductsController < ApplicationController
  # before_action :set_carted_product, only: [:show, :update, :destroy]

  def index
    @carted_products = CartedProduct.where(status: "carted",user_id: current_user.id)
    render :index
  end

  # def show
  #   render json: @carted_product
  # end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )
    # @carted_product.user = current_user

    if @carted_product.save
      render json: @carted_product, status: :created
    else
      render json: @carted_product.errors, status: :unprocessable_entity
    end
  end

  def update
    @carted_product = CartedProduct.find(params[:id])
      
    @carted_product.update(
      product_id: params[:product_id] || @product.product_id,
      quantity: params[:quantity] || @product.quantity,
      
    )
    
    render json: @carted_product
   

    render json: @carted_product.errors, status: :unprocessable_entity
  
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render json: {message: "item removed"}
  end


end



