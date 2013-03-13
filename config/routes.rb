Bwmanager::Application.routes.draw do

  match "/transactions/upload" => "transactions#upload"
  resources :transactions

  resources :sales
  resources :sale_lines

  resources :keyphrases

  resources :urls

  resources :t1links
  
  match "/campaigns/:id/duplicate" => "campaigns#duplicate", :as => "duplicate_campaign"
  resources :campaigns

  resources :clients

  devise_for :users
  resources :users

  root :to => "home#index"
end