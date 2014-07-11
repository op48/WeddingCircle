Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  
  resources :weddings do
    resources :roles, :only => [:index, :create, :destroy]
  end

  resources :tasks, :except => [:show]
 
  resources :users, :only => [] do
    collection do
      get :authorise_facebook
    end
  end

  resource :user, :only => [:show] 
  
  get 'facebook_oauth_callback', { #create verb
    :to => 'users#facebook_oauth_callback', #create action
    :as => :facebook_oauth_callback #create path helper
  }

  end
