class Configuration
  include Mongoid::Document
  
  field :square, type: Integer
  
  embedded_in :user
  embeds_one :address
end
