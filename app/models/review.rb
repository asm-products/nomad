class Review < ActiveRecord::Base
  validates :title, :body, :rating, presence: true  

  belongs_to :place

  def self.new_with_placeid(placeid, title, body, rating)
    new(
      place: Place.find_by_placeid(placeid),
      title: title,
      body: body,
      rating: rating
    )
  end

end
