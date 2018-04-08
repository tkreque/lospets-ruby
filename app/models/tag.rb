class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :icon, type: String
  field :description, type: String
  field :animal, type: Animal
  
end
