class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :from, type: String
  field :message, type: String
  
  validates_presence_of :from
  validates_presence_of :message
  validates_length_of :message, maximum: 255
  
  embedded_in :pet, :inverse_of => :comments
end
