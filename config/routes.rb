Rails.application.routes.draw do
  resources :posts
  
  get '/userPage', to: 'pages#userPage'
  get '/allPosts', to: 'posts#allUsersPosts'


  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
