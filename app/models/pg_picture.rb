class PgPicture < ActiveRecord::Base
  attr_accessible :image, :playgrounds_id
  belongs_to :playground
  mount_uploader :image, ImageUploader
  
end
