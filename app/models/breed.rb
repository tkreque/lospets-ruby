class Breed
  include Mongoid::Document
  
  field :name, type: String
  field :type, type: Animal
end
