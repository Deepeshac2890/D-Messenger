class AddColumnCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :category_image_url, :string
  end
end
