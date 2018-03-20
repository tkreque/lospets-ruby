json.extract! user, :id, :name, :contact, :pets, :address, :configuration, :img, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
