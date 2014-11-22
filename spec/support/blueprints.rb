require 'machinist/active_record'

Place.blueprint do
  placeid { "abc_1234d" }
  name { "Starbucks Downtown" }
  lat { -23.0039539 }
  lng { -43.3067975 }
end

Review.blueprint do
  place  { Place.make }
  title  { "Great place!" }
  body   { "Blah Blah Blah" }
  rating { 5 }
end
