class Animal
  include Mongoid::Document
  
  field :name, type: String
  field :icon, type: String
  
  embedded_in :breed
  # belongs_to :breed
end
