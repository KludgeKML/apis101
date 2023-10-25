Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :groups
      resources :roles
      resources :users
    end

    namespace :soap do
      wash_out :users
    end

    namespace :graphql do
      post "/execute", to: "graphql#execute"
    end
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/graphql/execute"
  end 

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
