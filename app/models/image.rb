# Class that represents images to be saved on database.
# It use Carrierwave to support the upload of images
class Image < ActiveRecord::Base
  # Save the image info on field name
  mount_uploader :data, ImagesUploader
  belongs_to :song

end
