Rails.application.routes.draw do
  get "people/new"

  get "people/create"

  get "people/destroy"

  get "people/update"

  get "people/index"

  get "people/:id", to: "people#show", as: "user"

  resources :users


  resources :posts

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
