class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :api_token, presence: true
  validates :email, :api_token, uniqueness: true

  before_validation do
    self.api_token = SecureRandom.hex
  end
end
