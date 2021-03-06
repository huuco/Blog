class PictureUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
    url = "fallback/" << [version_name, 50].compact.join("_")
    ActionController::Base.helpers.asset_path url
  end
end
