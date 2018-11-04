class AddAudioColumnToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :audio, :string
  end
end
