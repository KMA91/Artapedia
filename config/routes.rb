Rails.application.routes.draw do

  root 'users#index'

  post 'comments' => 'comments#create'

  get 'users/index' => 'users#index'

  post 'register' => 'users#register'

  post 'login' => 'sessions#create'

  get 'index' => 'videos#index'

  delete 'destroy' => 'sessions#logout'

  post 'likes/:id' => 'likes#create'

  post 'unlikes/:id' => 'unlikes#create'

  resources :videos, only: [:index, :new, :create, :show]

end
