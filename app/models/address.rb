class Address
  include Mongoid::Document
  field :lat, type: String
  field :lng, type: String
  field :street, type: String
  field :city, type: String
  
end
