Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  
  root 'static_pages#home'
  get '/pets',    to: 'pets#index'
  # get '/users',   to: 'users#index'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/pets/my', to: 'pets#my'
  
  resources :users, :only => [:show, :edit, :update]
  resources :pets do
    resources :comments
  end
  
  
end
