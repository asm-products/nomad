class Review < ActiveRecord::Base
  validates :place_id, :user_id, presence: true
end
