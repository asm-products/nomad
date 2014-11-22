class Place < ActiveRecord::Base
  acts_as_geolocated

  validates :name, :lat, :lng, presence: true

  has_many :reviews

  def self.find_by_placeid(placeid)
    find_by(placeid: placeid)
  end

  def self.find_or_create(options={})
    find_by_placeid(options[:placeid]) || create(options)
  end
end
