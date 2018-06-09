class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  mount_uploader :avatar, AvatarUploader
  
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at, type: Time
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :provider, type: String
  field :uid, type: String
  
  field :name, type: String
  # field :cpf, type: Integer
  field :notify_cellphone, type: Mongoid::Boolean, default: true
  field :notify_email, type: Mongoid::Boolean, default: true
  field :cellphone, type: Integer
  
  embeds_one :address
  has_many :pet
  embeds_one :configuration
  
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      if provider_data.provider == "twitter"
        user.name = provider_data.info.nickname
      else
        user.name = provider_data.info.name
      end
      user.avatar = provider_data.info.image
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
    end
  end
  
end
