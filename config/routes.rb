Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :groups
      resources :users

      put "/groups/:id/users/:user_id", to: "groups#add_user_to_group"
      delete "/groups/:id/users/:user_id", to: "groups#remove_user_from_group"
    end

    namespace :v2 do
      resources :groups
      resources :users

      get "/", to: "root#index"
    end

    namespace :soap do
      wash_out :users
    end

    namespace :graphql do
      post "/execute", to: "graphql#execute"
    end
  end

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/graphql/execute"
  mount Rswag::Ui::Engine, at: "/openapi"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
