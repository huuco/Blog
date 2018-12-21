class AvatarUploader < CarrierWave::Uploader::Base

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
<<<<<<< HEAD
    url = "fallback/" << [version_name, Settings.avatar_default].compact.join("_")
=======
    url = "fallback/" << [version_name, Settings.picture_default].compact.join("_")
>>>>>>> c312721... signup-login-edit-user
    ActionController::Base.helpers.asset_path url
  end
end
