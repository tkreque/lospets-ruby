class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  
  field :coordinates, :type => Array
  field :address
  
  geocoded_by :address            
  after_validation :geocode, :if => :address_changed?
  
  embedded_in :user
  embedded_in :pet
end
