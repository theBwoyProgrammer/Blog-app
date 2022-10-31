Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/posts' => 'posts#index'
  get '/posts/show' => 'posts#show'
  get '/users' => 'users#index'
  get '/users/show' => 'users#show'
end
