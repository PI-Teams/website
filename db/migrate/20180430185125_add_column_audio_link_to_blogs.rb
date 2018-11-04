class AddColumnAudioLinkToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :audio_link, :string
  end
end
