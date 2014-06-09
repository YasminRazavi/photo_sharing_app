Photoapp::Application.routes.draw do
  resources :comments


  resources :photos


  resources :collections


  devise_for :users

  root :to => "photos#index"

  match 'tagged' => 'photos#tagged', :as => 'tagged'

  devise_scope :user do
    match 'profile' => 'users#show', via: :get
  end


  
end
