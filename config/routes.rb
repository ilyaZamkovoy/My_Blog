Rails.application.routes.draw do
  resources :posts, only: %i(index new update destroy edit create)

  resources :recent_posts, only: :index

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :users do
    resources :posts, only: %i(index show), shallow: true, controller: "user_posts"
  end

  resources :users do
    resources :subscriptions, only: :create, shallow: true, controller: "subscription"
  end

  resources :users do
    get "page", to: "guest#show", as: "guest"
  end

  resources :subscriptions, only: %i(index destroy), shallow: true, controller: "subscription"

  resources :post do
    resources :comments, only: :create
  end

  resources :comments, only: %i(update destroy new edit show)

  root to: "recent_posts#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: :show
      resources :users, only: %i(show create update destroy)
    end
  end
end
