# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :movies do
        resources :seances
      end

      resources :cinema_halls do
        resources :seances
      end

      resources :ticket_desks do
        resources :reservations do
          resources :tickets
        end
      end

      resources :users do
        resources :reservations do
          resources :tickets
        end
      end
    end
  end
end
