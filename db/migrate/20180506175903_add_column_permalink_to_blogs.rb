class AddColumnPermalinkToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :permalink, :string
  end
end
