class ImagesController < ApplicationController


  def create 
    @image = Image.new(
    url: params[:url],
    product_id: params[:product_id]
  )
    if @image.save
      render :show
    else
      render json: { errors: @product.errors.full_messages}, 
      status: :unprocessable_entity 
    end

  end

end
