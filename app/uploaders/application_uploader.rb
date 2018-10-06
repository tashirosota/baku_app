class ApplicationUploader < CarrierWave::Uploader::Base

  version :thumb do
    process :resize_to_fit => [240, 240]
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path '/dummy_avatar.png', type: :image
  end

  def extension_white_list
    %W[jpg jpeg gif png]
  end

  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end
end