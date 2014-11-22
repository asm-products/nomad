require 'rails_helper'

RSpec.describe Place, :type => :model do
  before { Place.make! }
  
  it { should validate_presence_of :name }
  it { should validate_presence_of :lat }
  it { should validate_presence_of :lng }

  it "finds by place_id" do
    expect Place.find_by_placeid("abc_1234d").is_a?(Place) == true
  end

  it "finds or creates" do
    expect Place.find_or_create({placeid: "1234", name: "Test Place",
                                 lat: -12.345, lng: 54.321}).is_a?(Place) == true
  end
end
