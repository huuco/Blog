class PictureUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
    url = "fallback/" << [version_name, Settings.post.picture_default].compact.jioin("_")
    ActionController::Base.helpers.assets_path url
  end
end
