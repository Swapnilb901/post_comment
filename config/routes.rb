Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :posts
  devise_for :users
  root to: 'posts#index'
  put '/post/:id/like', to: 'posts#like_post', as: 'like'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
