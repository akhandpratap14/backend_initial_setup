Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      post "/register", to: "authentication#register"
      post "/login", to: "authentication#login"
      get "/block_user_update", to: "users#block_user_update"
    end
  end

end
