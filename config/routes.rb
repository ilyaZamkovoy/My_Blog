Rails.application.routes.draw do
  resources :comments

  get "subscription/show"

  get "subscription/index"

  get "subscription/create/:id", to: "subscription#create", as: "subscription"

  get "page/users/:id", to: "user_page#show", controller: "user_page", as: "user_page"

  resources :posts, only: [:index, :new, :update, :destroy, :edit]

  resources :recent_posts, only: :index

  devise_for :users, controllers: { registrations: "users/registrations"}

  resources :users do
    resources :posts, only: [:index, :show], shallow: true, controller: "user_posts"
  end

  resources :users do
      resources :subscription, only: [:create, :destroy, :index], controller: "subscription"
  end

  root to: "pages#home"
end
