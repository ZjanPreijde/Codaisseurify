class ImageUploader < CarrierWave::Uploader::Base
  class ImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  end
end
