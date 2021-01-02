# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clients
      resources :movies
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
