class PortfolioUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [700, 700]

  version :thumb_image do
     process resize_to_fit: [350, 200]
  end

  version :main_image do
     process resize_to_fit: [700, 400]
  end


  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
