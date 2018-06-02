class Breed
  include Mongoid::Document
  
  field :name, type: String
  field :type, type: Animal
  
  embedded_in :pet
  embeds_one :animal
  # has_one :animal
end
