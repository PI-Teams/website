class AddImagesToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :images, :json
  end
end
