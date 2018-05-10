class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]
  
  field :name, type: String
  field :email, type: String
  field :provider, type: String
  field :uid, type: String
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
  
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
