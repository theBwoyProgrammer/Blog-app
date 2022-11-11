Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do 
    namespace :v1 do
      post 'authenticate', to: 'authentication#create'
      resources :users, only: [:index, :show, :create, :destroy] do
        resources :posts, only: [:index] do 
          resources :comments, only: [:index,:create]
        end
      end

      resources :posts, only: [] do
        resources :comments, only: [:create]
      end
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, except: [:update] do
    resources :comments, except: [:update]
    resources :likes, only: [:create, :destroy]
  end
  end
  # get "/users/:id/posts/:id/new" => "comments#new", as: 'new_user_post_comment'
  # post "/users/:id/posts/:id" => "comments#create", as: 'user_post_comments'
  # post "/users/:id/posts/:id/likes" => "likes#create", as: 'user_post_likes'
end
