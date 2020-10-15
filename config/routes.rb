Rails.application.routes.draw do
  root 'top#index'
  devise_for :users

  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # books
  get 'books/' => 'books#index', as: 'index_books'
  get 'books/:id/' => 'books#show', as: 'show_books'
  get 'books/:id/edit' => 'books#edit', as: 'edit_books'
  patch 'books/:id' => 'books#update', as: 'update_books'
  delete 'books/:id' => 'books#destroy', as: 'destroy_books'

  # users
  get 'users/' => 'users#index', as: 'index_users'
  get 'users/:id/' => 'users#show', as: 'show_users'

  # home
  get 'home/about' => 'home#about', as: 'about_home'
end
