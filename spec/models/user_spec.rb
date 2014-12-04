require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  it "should genereate an API token" do
    user = User.create first_name: "Mario", last_name: "Gotze", email: "gotze@trashmail.com"
    expect(user.api_token).to_not be_nil
  end
end
