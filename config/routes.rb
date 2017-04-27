Rails.application.routes.draw do
  resources :comments
  resources :projects
  resources :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
