Bwmanager::Application.routes.draw do
  resources :campaigns


  resources :clients


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end