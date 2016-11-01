Rails.application.routes.draw do
  get "subscription/new"

  get "subscription/update"

  get "subscription/destroy"

  get "subscription/show"

  get "subscription/index"

  get "people/new"

  get "people/create"

  get "people/destroy/:id", to: "subscription#destroy", as: "destroysub"

  get "people/update"

  get "people/index"

  get "subscription/create/:id", to: "subscription#create", as: "subscription"

  get "people/:id", to: "people#show", as: "user"

  resources :posts

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
