Rails.application.routes.draw do
  resources :users
  resources :buckets
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
