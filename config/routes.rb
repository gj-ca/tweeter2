Rails.application.routes.draw do
  get "users", to: "users#index"
  get "users/new", to: "users#new"
  get "users/:user_id", to: "users#show", as: "user"
  post "users", to: "users#create"
  get "/users/:user_id/edit", to: "users#edit", as: "edit_user"
  patch "users/:user_id", to: "users#update"
  delete "users/:user_id", to: "users#destroy"
end
