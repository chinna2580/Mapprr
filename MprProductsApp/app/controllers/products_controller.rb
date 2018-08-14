class ProductsController < ApplicationController
	include ApplicationHelper

	# As a admin i should be able to see all the products
	def index
    api_method = 'products'
    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
    @products = ActiveSupport::JSON.decode http_get(path).body
    @images = @products['images']
    @products = @products['product']
    # render json: @products
	end

	# as a user, I should be able to add a new product.
	def new
		if request.post?
	    api_method = 'products'
	    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
	    params[:category][:name] = params[:category][:name].split(',')
	    params[:tags][:name] = params[:tags][:name].split(',')
	    # <#Assumption> Assuming single image upload from the file upload
	    # <#Assumption> Assuming images urls are provided
	    if !params[:product][:image].nil?
		    params[:product][:path] = params[:product][:image].path
		    params[:product][:content_type] = params[:product][:image].content_type
		    params[:product][:file_name] = params[:product][:image].original_filename
		  end
	    params[:product].delete(:image)
	    @product = ActiveSupport::JSON.decode http_post(path, params).body
	    respond_to do |format|
	      if @product['id']
	        format.html { redirect_to '/products/'+@product['id'].to_s, notice: 'Product was successfully created.' }
	        # format.json { render :show, status: :created, location: @product }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
		else
			@product = {
			}
		end
	end

	# as a user, i should be able to edit a product details.
	def edit
		if request.post?
	    api_method = 'products'
	    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
	    params[:category][:name] = params[:category][:name].split(',')
	    params[:tags][:name] = params[:tags][:name].split(',')
	    @product = ActiveSupport::JSON.decode http_post(path, params).body
	    respond_to do |format|
	      if @product['id']
	        format.html { redirect_to '/products/'+@product['id'].to_s, notice: 'Product was successfully updated.' }
	        # format.json { render :show, status: :created, location: @product }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
		else
			api_method = 'products/' + params[:id]
	    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
	    @product = ActiveSupport::JSON.decode http_get(path).body
	    puts 'inside edit'
	    puts @product.inspect
			
		end
	end

	# As a user, i should be able to see a product details.
	def show
		api_method = 'products/' + params[:id]
    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
    @product = ActiveSupport::JSON.decode http_get(path).body
    puts @product['image'].inspect
	end
end
