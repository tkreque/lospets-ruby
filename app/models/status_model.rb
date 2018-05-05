class StatusModel
  include Mongoid::Document
  
  field :name, type: String
  field :icon, type: String
  field :description, type: String
end
