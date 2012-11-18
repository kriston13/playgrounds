class Playground < ActiveRecord::Base
  attr_accessible :country, :latitude, :longitude, :name, :play_id, :state, :suburb, :country, :place, :address
  has_many :pg_pictures
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  
  after_validation :geocode, :reverse_geocode


  def set_playground_location(latitude, longitude, place)
    self.latitude = latitude
    self.longitude = longitude
    logger.debug "!!!!!!!!!!!!!!!!!!!!!!!! place being saved to playground is: #{place}"
    self.address = place
    self.save
  end
  
end
