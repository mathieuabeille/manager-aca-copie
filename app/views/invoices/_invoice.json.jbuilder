json.extract! invoice, :id, :author, :status, :invoicetype, :name, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
