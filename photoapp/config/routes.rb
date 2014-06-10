Photoapp::Application.routes.draw do
  resources :comments


  resources :photos do 
    member do
      get :vote
    end 
  end


  resources :collections


  devise_for :users

  root :to => "photos#index"

  match 'tagged' => 'photos#tagged', :as => 'tagged'

  devise_scope :user do
    match 'profile' => 'users#profile', via: :get
    match 'users' => 'users#index', via: :get
    match 'users/:id' => 'users#show', via: :get
  end


  
end
