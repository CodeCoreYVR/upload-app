class Scrap < ActiveRecord::Base
  mount_uploader :image, ScrapImageUploader
end
