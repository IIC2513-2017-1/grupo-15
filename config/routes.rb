Rails.application.routes.draw do
  resources :updates
  resources :pledges, only: [:index, :new, :create]
  resources :comments
  resources :projects
  resources :rewards, only: [:new, :create]
  resources :users#, except: [:index]
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
