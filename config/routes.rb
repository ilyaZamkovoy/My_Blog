Rails.application.routes.draw do
  resources :comments
  get "subscription/show"

  get "subscription/index"

  get "people/destroy/:id", to: "subscription#destroy", as: "destroysub"

  get "people/update"

  get "people/index"

  get "subscription/create/:id", to: "subscription#create", as: "subscription"

  get "people/:id", to: "people#show", as: "user"

  get "comments/show/:id", to: "comments#show", as: "comment"

  resources :posts

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
