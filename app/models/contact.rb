class Contact
  include Mongoid::Document
  
  field :mail, type: String
  field :socialMedia, type: Array
  field :cellPhone, type: Array
  
  embedded_in :user
end
