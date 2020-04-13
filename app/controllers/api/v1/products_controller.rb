module Api
	module V1
		class ProductsController < ApplicationController
			skip_before_action :verify_authenticity_token
		  def index
		    products = Product.all
		    render json: products, status: 200
		  end

		  # POST /users
		  def create
		  	product = Product.new(product_params)
		  	if product.save
		  		render json: product, status: 201
		  	else
		  		render json: {error: 'Unable to crate product'}, status: 422
		  	end
		  end

		  def update
		    product = Product.find(params[:id])
		    if product.update(product_params)
		      render json: product, status: 200
		    else
		      render json: { errors: product.errors }, status: 422
		    end
		  end

		  def destroy
		  	product = Product.find(params[:id])
		  		product.destroy
		  	  render json: product, status: 204
		  	  head :no_content

		    # product = product.find(params[:id])
		    # product.destroy
		    # render status: 204
		    
		  end


		  private
		  def product_params
		  	params.require(:product).permit(:name, :price)
		  end

		end
	end
end

