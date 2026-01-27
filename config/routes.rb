Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'diaries#index', as: :authenticated_root
  end

  root "static_pages#top"

  resources :diaries, only: [:index, :new, :create]

  get "up" => "rails/health#show", as: :rails_health_check
end