class Animal
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :icon, type: String
  
end
