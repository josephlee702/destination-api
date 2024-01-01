Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :destinations
    end

    namespace :v2 do
      resources :destinations, only: [:index]
    end
  end
end
