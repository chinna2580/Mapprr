class AddCategoriesTagsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :categories, :text
    add_column :products, :tags, :text
  end
end
