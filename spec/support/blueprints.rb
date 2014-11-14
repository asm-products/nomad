require 'machinist/active_record'

Place.blueprint do
  name { "Starbucks Downtown" }
  lat { -23.0039539 }
  lng { -43.3067975 }
end
