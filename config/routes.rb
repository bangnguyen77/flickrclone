Rails.application.routes.draw do
  devise_for :users do
    resources :images
  end

  root :to => "images#index"

  resources :images
end
