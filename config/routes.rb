Rails.application.routes.draw do
  devise_for :clients, skip: :registrations
  devise_for :staffs, skip: :registrations

  resources :clients, only: [:index, :create]

  resources :staffs, only: :index do
    get :me, on: :collection
  end

  get :asset_path, to: 'application#asset_path'
  root to: 'application#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
