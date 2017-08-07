class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include Piet::CarrierWaveExtension

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process resize_to_fit: [100, 100]

  version :icon do
    process resize_to_fit: [30, 30]
  end

  process optimize: [quality: 70]

end
