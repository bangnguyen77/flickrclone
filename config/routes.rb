Rails.application.routes.draw do
  devise_for :users

  root :to => "images#index"

  resources :users, :only => [:show]

  resources :images
end
