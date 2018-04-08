class Status
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :iconColor, type: String
  field :description, type: String
end
