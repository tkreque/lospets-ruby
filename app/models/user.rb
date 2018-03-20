class User
  include Mongoid::Document
  field :name, type: String
  field :contact, type: String
  field :pets, type: String
  field :address, type: String
  field :configuration, type: String
  field :img, type: String
  field :password, type: String
end
