class Status
  include Mongoid::Document
  
  field :name, type: String
  field :iconColor, type: String
  field :description, type: String
end
