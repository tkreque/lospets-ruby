class AnimalModel
  include Mongoid::Document
  
  field :name, type: String
  field :icon, type: String
end
