Photoapp::Application.routes.draw do
  resources :comments


  resources :photos


  resources :collections


  devise_for :users

  root :to => "photos#index"
end
