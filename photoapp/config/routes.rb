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
end
