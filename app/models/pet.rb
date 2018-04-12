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
  

end
