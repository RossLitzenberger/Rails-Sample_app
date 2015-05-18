Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'account_activations/edit'
# Static_pages Controller
 	root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
# Session Controller
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
# User Controller 
  resources :users do
    member do
      get :following, :followers
    end
  end
#  Account activations resource
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end