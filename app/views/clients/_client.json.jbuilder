json.extract! client, :id, :name, :address, :phone, :leader, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
