# frozen_string_literal: true

Rails.application.routes.draw do
  concern :rentable do
    resources :rentals
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clients, concerns: :rentable
      resources :movies
      resources :genres
      resources :vhs, concerns: :rentable
      resources :rentals
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
