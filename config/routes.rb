Rails.application.routes.draw do
  resources :posts
  get 'posts/new', to:'posts#new'



  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
