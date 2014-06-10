Photoapp::Application.routes.draw do
  resources :comments

  resources :photos do 
    member do
      get :vote
    end 
  end
  


  resources :collections do 
    member do 
      get :photos, to: "photos#index"
    end
  end


  devise_for :users

  get "/users/:user_id/collections", to: "collections#index"

  root :to => "photos#index"

  match 'tagged' => 'photos#tagged', :as => 'tagged'

  get "/my_collections", to: "collections#index", collections_type: :my_collections

  devise_scope :user do
    match 'profile' => 'users#profile', via: :get
    match 'users' => 'users#index', via: :get
    match 'users/:id' => 'users#show', via: :get
  end


  
end
