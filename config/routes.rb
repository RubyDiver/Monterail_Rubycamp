# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show] do
        resources :seances, only: %i[index]
      end

      resources :ticket_desks, only: %i[show] do
        resources :reservations, only: %i[index show create destroy] do
          collection do
            post '/online', to: 'reservations#create_online'
            post '/offline', to: 'reservations#create_offline'
          end

          resources :tickets, only: %i[index show destroy]
        end
      end
      resources :users, only: %i[show create update destroy] do
        resources :reservations, only: %i[index show create destroy] do
          resources :tickets, only: %i[index show destroy]
        end
      end
    end
  end
end
