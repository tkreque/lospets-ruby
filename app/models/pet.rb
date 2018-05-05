class Pet
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :breed, type: Breed
  field :status, type: Status
  field :address, type: Address
  field :user, type: User
  field :image, type: Array
  field :tag, type: Array
  
  # embeds_one :user
  embeds_many :tag
  embeds_one :breed
  embeds_one :status
  embeds_one :address
  # embedded_in :user
end
