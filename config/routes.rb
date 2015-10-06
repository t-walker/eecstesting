Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :responses
  resources :questions
  resources :tests

  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/update'
  get 'questions/destroy'


  root 'home#index'
end
