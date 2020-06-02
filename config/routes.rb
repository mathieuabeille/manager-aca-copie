Rails.application.routes.draw do
  get 'findclients/:client', to: 'invoices#index', as: :findclient
  resources :charges

  get    "invoices/preview/:id",      to: "invoices#preview", as: :preview
  get    "invoices/create_payment/:id",      to: "invoices#create_payment", as: :create_payment
  get    "invoices/new_payment/:id",      to: "invoices#new_payment", as: :new_payment

  resources :labels
  resources :clients
  resources :invoices do
    resources :invoicelines
  end
  resources :materials do
    resources :material_comments
  end
  resources :filters
  resources :folders do
    resources :documents
  end
  devise_for :users
  root to: 'folders#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


