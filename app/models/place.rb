class Place < ActiveRecord::Base
  acts_as_geolocated

  validates :name, :lat, :lng, presence: true

  has_many :reviews

  def self.find_by_placeid(placeid)
    find_by(placeid: placeid)
  end
end
