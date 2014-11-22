class Review < ActiveRecord::Base
  validates :title, :body, :rating, presence: true  

  belongs_to :place

  def self.create_with_placeid(placeid, options)
    Place.find_by_placeid(placeid)
  end

end
