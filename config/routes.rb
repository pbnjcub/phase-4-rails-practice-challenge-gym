Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :memberships, only: [:index, :create, :update, :destroy]
  # post '/memberships', to: 'memberships#create'
  resources :gyms, only: [:show, :destroy]
  resources :clients, only: [:show, :destroy]
end
