class RemoveAudioLinkFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :audio_link, :string
  end
end
