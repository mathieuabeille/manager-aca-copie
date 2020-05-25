Rails.application.routes.draw do
  resources :labels
  resources :invoicelines
  resources :clients
  resources :invoices
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
