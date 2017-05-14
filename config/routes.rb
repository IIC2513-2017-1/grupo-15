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
  resources :users#, except: [:index]
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
