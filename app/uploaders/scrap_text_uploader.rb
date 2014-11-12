class ScrapTextUploader < CarrierWave::Uploader::Base
  storage :fog
end
