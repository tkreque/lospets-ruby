class Address
  include Mongoid::Document
  field :lat, type: String
  field :lng, type: String
  field :streetName, type: String
  field :cityName, type: String
  field :stateName, type: String
  field :countryName, type: String
end
