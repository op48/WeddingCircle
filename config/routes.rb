Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :users do
    collection do
      get :authorise_facebook
      #get :github_oauth_callback
    end
  end

  get 'facebook_oauth_callback', { #create verb
    :to => 'users#facebook_oauth_callback', #create action
    :as => :facebook_oauth_callback #create path helper
  }

  end
