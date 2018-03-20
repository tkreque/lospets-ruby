class Pet
  include Mongoid::Document
  field :name, type: String
  field :breed, type: String
  field :status, type: String
  field :address, type: String
  field :user, type: String
  field :img, type: String
  field :tag, type: String
end
