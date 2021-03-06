class Pet
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :image, AvatarUploader
  
  field :name, type: String
  field :breed, type: Breed
  field :status, type: Status
  field :address, type: Address
  field :tag, type: Array
  field :ok, type: Mongoid::Boolean, default: false
  
  belongs_to :user
  embeds_many :tag
  embeds_one :breed
  embeds_one :status
  embeds_one :address
  embeds_many :comments
end
