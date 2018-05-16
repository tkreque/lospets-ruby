class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  
  field :coordinates, :type => Array
  field :address
  
  geocoded_by :address               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates    
  
  embedded_in :user
  embedded_in :pet
end
