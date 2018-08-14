module Api
	module V1
		class ProductsController < ApplicationController
		  before_action :set_product, only: [:show, :update, :destroy]

		  # GET /products
		  def index
		    @images = ProductImage.select('products_id,image_path').group_by(&:products_id)
		    @products = Product.all

		    render json: { product: @products, images: @images }
		  end

		  # GET /products/1
		  def show
		    render json: @product
		  end

		  # POST /products
		  def create
		  	if params[:id].nil?
			    @product = Product.new(product_params)

			    if @product.save
			    	@product.update(categories: category_params[:name].join(','), tags: tag_params[:name].join(','))
			    	if params[:product][:path]
			    		@product.image.attach(io: File.open(params[:product][:path]), filename: params[:product][:file_name], content_type: params[:product][:content_type])
			    	end
						
			      if !params[:product][:image_path].nil?
			      	params[:product][:image_path].split(',').each do |image_path|
			      		@product_images = ProductImage.create(products_id: @product[:id], image_path: image_path)
			      	end
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
			    @product.update(categories: category_params[:name].join(','), tags: tag_params[:name].join(','))
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
		    	params.require(:category).permit(:name => [])
		    end

		    def tag_params
		    	params.require(:tags).permit(:name => [])
		    end
		end
	end
end
