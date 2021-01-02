# frozen_string_literal: true

Rails.application.routes.draw do
  concern :rentable do
    resources :rentals
  end
  concern :generable do
    resources :movie_genres
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clients, concerns: :rentable
      resources :vhs, concerns: :rentable
      resources :rentals
      resources :movies, concerns: :generable
      resources :genres, concerns: :generable
      resources :movie_genres
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
