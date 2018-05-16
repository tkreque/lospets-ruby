class AvatarUploader < CarrierWave::Uploader::Base
  storage :fog
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
