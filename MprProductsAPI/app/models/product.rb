class Product < ApplicationRecord
	has_one_attached :image
	# has_many :product_image
end
