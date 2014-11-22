require 'rails_helper'

RSpec.describe Place, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :lat }
  it { should validate_presence_of :lng }

  it "finds by place_id" do
    Place.make!

    place = Place.find_by_placeid("abc_1234d")

    place.should be_a Place
    place.placeid.should eq "abc_1234d"
  end
end
