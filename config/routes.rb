Rails.application.routes.draw do
  devise_for :clients
  devise_for :staffs

  resources :clients, only: :index
  resources :staffs, only: :index

  root to: 'application#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
