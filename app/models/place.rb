class Place < ActiveRecord::Base
  acts_as_geolocated

  validates :name, :lat, :lng, presence: true
end
