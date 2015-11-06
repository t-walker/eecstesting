Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users/', :to => 'users#index'

  resources :responses
  resources :questions
  resources :usertests
  resources :notifications
  resources :testversions

  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/update'
  get 'questions/destroy'

  get 'showtest' => 'usertests#showtest', :as => "showtest"

  put 'addadmin/:id' => 'users#make_admin', :as => "make_admin"
  put 'removeadmin/:id' => 'users#remove_admin', :as => "remove_admin"
  put 'makeadvisor/:id' => 'users#make_advisor', :as => "make_advisor"
  put 'removeadvisor/:id' => 'users#remove_advisor', :as => "remove_advisor"

  root 'home#index'
end
