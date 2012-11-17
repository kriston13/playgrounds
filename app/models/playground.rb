class Playground < ActiveRecord::Base
  attr_accessible :country, :latitude, :longitude, :name, :play_id, :state, :suburb
  has_many :pg_pictures
  
end
