class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  
  field :coordinates, :type => Array
  field :address
  
  geocoded_by :address            
  after_validation :geocode  #, :if => :address_changed?
  
  reverse_geocoded_by :coordinates
  after_validation :reverse_geocode
  
  embedded_in :user
  embedded_in :pet
  embedded_in :configuration
end
