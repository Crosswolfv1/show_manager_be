Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :festivals, only: [:index, :show], param: :id do
        delete '/artist/:artist_id', to: 'attending_artist_festivals#delete', as: :delete_attending_artist_festival
      end
    end
  end
end
