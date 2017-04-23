Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'users#index'

  get '/users/:id' => 'users#show', as: :user
  get '/users' => 'users#index', as: :users


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
