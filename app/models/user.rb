class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :contact, type: Contact
  field :pets, type: Array
  field :configuration, type: Configuration
  field :address, type: Address
  field :image, type: String
  
  embeds_one :configuration
  embeds_one :address
  # embedded_in :pet
  embeds_one :contact
  # embeds_many :pet
end
