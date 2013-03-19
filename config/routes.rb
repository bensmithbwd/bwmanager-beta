Bwmanager::Application.routes.draw do

  match "/transactions/accounts_report" => "transactions#accounts_report", :as => "accounts_report"
  match "/transactions/upload" => "transactions#upload", :as => "upload_transactions"
  resources :transactions

  resources :sales do
    resources :sale_lines
  end

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