class Animal
  include Mongoid::Document
  
  field :name, type: String
  field :icon, type: String
  
end
