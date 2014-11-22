class Review < ActiveRecord::Base
  validates :name, :body, :rating, presence: true  

  belongs_to :place

  def self.create_with_placeid(placeid, title, body, rating)
    create(
      place: Place.find_by_placeid(placeid),
      title: title,
      body: body,
      rating: rating
    )
  end

end
