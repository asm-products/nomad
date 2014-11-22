require 'rails_helper'

RSpec.describe Review, :type => :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :rating }

  it "creates with a place_id" do
    Review.new_with_placeid(
      "abc_1234d",
      "Great place!",
      "Blah Blah Blah",
      5
    ).save.should eq true
  end

end
