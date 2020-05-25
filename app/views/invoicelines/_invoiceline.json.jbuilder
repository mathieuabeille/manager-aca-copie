json.extract! invoiceline, :id, :name, :price, :quantity, :created_at, :updated_at
json.url invoiceline_url(invoiceline, format: :json)
