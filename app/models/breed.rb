class Breed
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: Animal
end
