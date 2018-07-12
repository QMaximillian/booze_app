Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :alcohols, except: [:index]
  resources :user_alcohols
  resources :stores
  resources :store_alcohols

  root 'users#welcome', as: 'welcome'
  # get '/', to: 'users#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  # get '/home', to: 'users#home', as: 'user_home'
  post '/sessions', to: "sessions#create", as: "sessions"
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/wines', to: 'alcohols#wines', as: 'wines'
  get '/beers', to: 'alcohols#beers', as: 'beers'
  get '/liquors', to: 'alcohols#liquors', as: 'liquors'
  get '/alcohols', to: 'alcohols#index', as: 'all_alcohol' 
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
