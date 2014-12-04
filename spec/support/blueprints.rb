require 'machinist/active_record'

Place.blueprint do
  name { "Starbucks Downtown" }
  lat { -23.0039539 }
  lng { -43.3067975 }
end

Review.blueprint do
  # Attributes here
end

User.blueprint do
  first_name { "Lionel" }
  last_name { "Messi" }
  email { "lionel#{sn}@trashmail.com" }
end
