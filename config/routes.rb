Rails.application.routes.draw do
  resources :posts

  get "/userPage", to: "pages#user_page"
  get "/allPosts", to: "posts#all_users_posts"

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
