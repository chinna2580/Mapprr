module Api
	module V1
		class ProductsController < ApplicationController
		  before_action :set_product, only: [:show, :update, :destroy]

		  # GET /products
		  def index
		    @products = Product.all

		    render json: @products
		  end

		  # GET /products/1
		  def show
		  	puts 'inside show::'
		  	puts @product.inspect
		    render json: @product
		  end

		  # POST /products
		  def create
		  	if params[:id].nil?
			    @product = Product.new(product_params)

			    if @product.save
			    	puts category_params[:name].inspect
			    	params[:category][:name] = params[:category][:name].split(',')
			    	puts params[:category][:name]
			    	params[:tags][:name] = params[:tags][:name].split(',')
			    	params[:category][:name].each do |category|
			    		@category = Category.find_by(name: category)
			    		if !@category.nil?
			    			@product_category = ProductCategory.create(categories_id: @category[:id], products_id: @product[:id])
			    		else
			    			@category = Category.create(name: category)
			    			@product_category = ProductCategory.create(categories_id: @category[:id], products_id: @product[:id])
			    		end
			    	end
			    	params[:tags][:name].each do |tag|
			    		@tag = ProductTag.create(name: tag, products_id: @product[:id])
			    	end
			      render json: @product, status: :created, location: @product
			    else
			      render json: @product.errors, status: :unprocessable_entity
			    end
		  	else
		  		@product = Product.find(params[:id])
		  		update
		  	end
		  end

		  # PATCH/PUT /products/1
		  def update
		    if @product.update(product_params)
		      render json: @product
		    else
		      render json: @product.errors, status: :unprocessable_entity
		    end
		  end

		  # DELETE /products/1
		  def destroy
		    @product.destroy
		  end

		  private
		    # Use callbacks to share common setup or constraints between actions.
		    def set_product
		      @product = Product.find(params[:id])
		    end

		    # Only allow a trusted parameter "white list" through.
		    def product_params
		      params.require(:product).permit(:name, :sku_id, :price, :expiry_date)
		    end

		    def category_params
		    	params.require(:category).permit(:name)
		    end

		    def tag_params
		    	params.require(:tags).permit(:name)
		    end
		end
	end
end
