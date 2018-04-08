class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :contact, type: Contact
  field :pets, type: Array
  field :configuration, type: Configuration
  field :address, type: Address
  field :image, type: String
end
