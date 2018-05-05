class Configuration
  include Mongoid::Document
  
  field :param, type: String
  field :value, type: String
  
  embedded_in :user
end
