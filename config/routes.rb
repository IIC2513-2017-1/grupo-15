Rails.application.routes.draw do

  root 'home#index'
  resource :session, only: [:new, :create, :destroy]
  resources :follows, only: [:new,:create, :destroy]
  resources :updates
  resources :projects do
    resources :comments, only: [:create]
    resources :rewards, except: [:show]
  end
  resources :users
  resources :pledges, only: [:index, :new, :create]

  #----------------------------------API----------------------------------
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :projects
    end
  end

  namespace :api do
    namespace :v1 do
      #resources :projects, only: [:index, :create, :show]

      resources :projects, only: [:index, :create, :show] do
        resources :comments, only: [:show]
        resources :rewards, only: [:show] do
          resources :pledges, only: [:create, :new]
        end
      end
      resources :users, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
