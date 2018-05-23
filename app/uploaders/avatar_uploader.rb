class AvatarUploader < CarrierWave::Uploader::Base
  storage :fog
  
  def store_dir
    "img/#{model.id}"
  end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
