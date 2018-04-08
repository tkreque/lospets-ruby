class Configuration
  include Mongoid::Document
  field :param, type: String
  field :value, type: String
end
