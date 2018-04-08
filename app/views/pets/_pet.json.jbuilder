json.extract! pet, :id, :name, :breed, :status, :address, :user, :image, :tag, :created_at, :updated_at
json.url pet_url(pet, format: :json)
