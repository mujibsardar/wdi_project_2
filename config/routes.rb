Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :reviews

  get    '/reviews/new/:user_id' => 'reviews#new', as: :new_review_for_user 

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

  # get '/users/:id' => 'users#show', as: :user
  # get '/users' => 'users#index', as: :users


  # get 'reviews/index'
  #
  # get 'reviews/show'
  #
  # get 'reviews/new'
  #
  # get 'reviews/create'
  #
  # get 'reviews/edit'
  #
  # get 'reviews/update'
  #
  # get 'reviews/destroy'
  #
  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'users/edit'
  #
  # get 'users/update'
  #
  # get 'users/destroy'

end
