Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :follows, only: [:new,:create, :destroy]
  resources :updates
  resources :pledges, only: [:index, :new, :create]
  resources :comments
  resources :projects do
    resources :comments
    resources :rewards do
      resources :pledges
    end
  end
  resources :rewards, only: [:index, :new, :create]
  resources :users

  #----------------------------------API----------------------------------
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :projects
    end
  end

  root 'home#index'

  namespace :api do
    namespace :v1 do
      #resources :projects, only: [:index, :create, :show]
      
      resources :projects, only: [:index, :create, :show] do
        resources :rewards, only: [:show]
        resources :comments, only: [:show]
      end
      resources :users, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
