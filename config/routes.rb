Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'tickets#index'

  resources :tickets, only: %i[create show]

  namespace :api do
    resources :tickets, only: :create
  end
end
