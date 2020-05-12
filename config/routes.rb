Rails.application.routes.draw do
  resources :materials do
    resources :material_comments
  end
  resources :folders do
    resources :documents
  end
  devise_for :users
  root to: 'folders#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
