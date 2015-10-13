Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  get 'users/', :to => 'users#index'

  resources :responses
  resources :questions
  resources :usertests

  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/update'
  get 'questions/destroy'
  root 'home#index'
end
