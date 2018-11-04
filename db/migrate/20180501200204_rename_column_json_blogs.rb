class RenameColumnJsonBlogs < ActiveRecord::Migration[5.0]
  def change
    rename_column :blogs, :fotos, :images
  end
end
