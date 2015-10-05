Rails.application.routes.draw do
  resources :responses
  resources :questions
  resources :tests
  devise_for :users, controllers: {registrations: "users/registrations"}

  root 'home#index'
end
