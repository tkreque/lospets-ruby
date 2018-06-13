class TagModel
  include Mongoid::Document
  
  field :name, type: String
  field :icon, type: String
  field :description, type: String
  field :category, type: String
  field :categoria, type: String
end
