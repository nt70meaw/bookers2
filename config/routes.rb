Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
get "/home/about" => "homes#about"
get '/about', to: 'pages#about'
devise_for :users
resources :users do resources :books, only: [:create]
resources :books
get 'users/show'
get 'users/edit'
resources :user_images, only: [:new, :create, :index, :show]
 end
end