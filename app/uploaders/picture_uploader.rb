class PictureUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
<<<<<<< HEAD
    url = "fallback/" << [version_name, Settings.picture_default].compact.join("_")
    ActionController::Base.helpers.asset_path url
=======
    url = "fallback/" << [version_name, Settings.post.picture_default].compact.jioin("_")
    ActionController::Base.helpers.assets_path url
>>>>>>> c312721... signup-login-edit-user
  end
end
