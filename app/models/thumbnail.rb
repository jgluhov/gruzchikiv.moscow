class Thumbnail < ActiveRecord::Base
  mount_uploader :image, ThumbnailUploader
end
