class ProductsController < ApplicationController
	include ApplicationHelper
	def index
    api_method = 'products'
    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
    @products = ActiveSupport::JSON.decode http_get(path).body
    # render json: @products
	end

	def new
		if request.post?
	    api_method = 'products'
	    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
	    params[:category][:name] = params[:category][:name].split(',')
	    params[:tags][:name] = params[:tags][:name].split(',')
	    # params[:product][:image_details][:path] = params[:product][:image].path
	    # puts params[:product][:image].path
	    # puts params[:product][:image].content_type
	    params[:product][:path] = params[:product][:image].path
	    params[:product][:content_type] = params[:product][:image].content_type
	    params[:product][:file_name] = params[:product][:image].original_filename
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
			# @product = {
			# 	name: '',
			# 	expiry_date: nil,
			# 	price: nil,
			# 	sku_id: nil
			# }
			@product = {
				# expiry_date: ''
			}
			# render layout: 'products/new'
		end
	end

	def edit
		if request.post?
	    api_method = 'products'
	    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
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
		# @product = {
		# 	name: "dsff",
		# 	expiry_date(1i)
		# }
		#{ }"product":{"name":"dsdf","expiry_date(1i)":"2018","expiry_date(2i)":"8","expiry_date(3i)":"14","price":"1000","sku_id":"122"}
	end

	def show
		api_method = 'products/' + params[:id]
    path = Rails.configuration.MprProductsAPI.to_s + api_method.to_s
    @product = ActiveSupport::JSON.decode http_get(path).body
    puts @product['image'].inspect
	end
end
