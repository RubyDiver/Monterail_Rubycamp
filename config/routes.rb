Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :movies


      resources :cinema_halls do
        resources :movies do
          resources :seances
        end
      end

      resources :ticket_desks do
        resources :seances do
          resources :reservations do
            resources :tickets
          end
        end
      end
    end
  end
end
