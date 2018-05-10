class Contact
  include Mongoid::Document
  
  field :socialMedia, type: Array
  field :cellPhone, type: Array
  
  embedded_in :user
end
