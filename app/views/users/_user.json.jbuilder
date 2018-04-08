json.extract! user, :id, :name, :contact, :pets, :configuration, :address, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
