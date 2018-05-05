class Tag
  include Mongoid::Document
  
  field :name, type: String
  field :icon, type: String
  field :description, type: String
  field :category, type: String
  
  embedded_in :pet
end
