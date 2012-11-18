#require 'file_size_validator'
class PgPicture < ActiveRecord::Base
  attr_accessible :image, :playgrounds_id, :latitude, :longitude, :place
  belongs_to :playground
  mount_uploader :image, ImageUploader
  geocoded_by :place
  reverse_geocoded_by :latitude, :longitude, :address => :place
  #validates :file_size => { :maximum => 1.5.megabytes.to_i }

  before_save :get_geocode, :reverse_geocode
  
  
  private
    def get_geocode
      if image.present?
        
        img = Magick::Image.read(image.path)[0]
        
        img_lat = img.get_exif_by_entry('GPSLatitude')[0][1].split(', ') rescue nil
        img_lng = img.get_exif_by_entry('GPSLongitude')[0][1].split(', ') rescue nil
        
        logger.debug "img_lat: #{img_lat}"


        lat_ref = img.get_exif_by_entry('GPSLatitudeRef')[0][1] rescue nil
        lng_ref = img.get_exif_by_entry('GPSLongitudeRef')[0][1] rescue nil

        return unless img_lat && img_lng && lat_ref && lng_ref

        latitude = to_frac(img_lat[0]) + (to_frac(img_lat[1])/60) + (to_frac(img_lat[2])/3600)
        longitude = to_frac(img_lng[0]) + (to_frac(img_lng[1])/60) + (to_frac(img_lng[2])/3600)

        latitude = latitude * -1 if lat_ref == 'S'  # (N is +, S is -)
        longitude = longitude * -1 if lng_ref == 'W'   # (W is -, E is +)

        self.latitude = latitude
        self.longitude = longitude
        
        #img = Magick::Image.read(image)
        
        #tempPix = EXIFR::JPEG.new(image)
        #self.latitude = EXIFR::JPEG.new(image.path.to_s).gps_lat
        #self.longtitude = tempPix.gps_lng
      end
    end
    
    def to_frac(frac)
      numerator, denominator = frac.split('/').map(&:to_f)
      denominator ||= 1
      numerator/denominator
    end
  
end
