class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render :show
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email],
      )

    if @supplier.save!
      render :show
    else
      #error handling
      render json: { errors: @supplier.errors.full_messages}, 
      status: :unprocessable_entity
    end
  end


end

