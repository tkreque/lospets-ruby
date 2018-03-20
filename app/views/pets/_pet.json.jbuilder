json.extract! pet, :id, :name, :breed, :status, :address, :user, :img, :tag, :created_at, :updated_at
json.url pet_url(pet, format: :json)
