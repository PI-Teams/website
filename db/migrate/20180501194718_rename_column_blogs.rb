class RenameColumnBlogs < ActiveRecord::Migration[5.0]
  def change
    rename_column :blogs, :images, :fotos
  end
end
