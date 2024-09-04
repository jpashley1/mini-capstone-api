class ProductsController < ApplicationController
  def index
    render json: { message: "hello" }
  end

  def show
    render json: { message: "Show" }
  end

  def create
    render json: { message: "create" }
  end

  def update
    render json: { message: "update" }
  end

  def destroy
    render json: { message: "destroy" }
  end

  # def handle_root_not_found
  #   render json: { message: "route not found" }, status: 404
  # end

  # def index
  #   @products = Product.all
  #   render template: "products/index"
  # end
end
