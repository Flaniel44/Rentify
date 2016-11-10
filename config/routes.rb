Rails.application.routes.draw do
  get 'sessions/new'

#maps requests for the URL /controller/method to the home action in controller

  get 'static_pages/home'

  get 'static_pages/help'


  
  
  
  get  'static_pages/home'
  get  'static_pages/help'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/createListing', to: 'listings#new'
  post '/createListing', to: 'listings#create'
  
  root 'static_pages#home' #Root of the website is the hello action in the application controller
  resources :users, :listings
  
end
