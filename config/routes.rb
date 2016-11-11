 
#Author: Daniel Spagnuolo
#Date: November 10th
#Purpose: maps requests for the URL to the proper /controller/action


Rails.application.routes.draw do
  get 'sessions/new'

  get  'static_pages/home'
  get  'static_pages/help'
  
  get  '/signup',  to: 'users#new' #Assigns the signup URL get to the users new action
  post '/signup',  to: 'users#create' #When the URL posts, the data is sent to the users create action
  get    '/login',   to: 'sessions#new' #Assigns the login URL get to the sessions new action
  post   '/login',   to: 'sessions#create' #Sends the login url post method data to the session create action
  delete '/logout',  to: 'sessions#destroy' #Assigns the delete method from the url to the proper action
  get '/createListing', to: 'listings#new' #Assigns the createListing url get to the proper action
  post '/createListing', to: 'listings#create' #sends the createListing post data to the proper action
  
  root 'static_pages#home' #Root of the website is the hello action in the application controller
  
  resources :users, :listings #allows for specific resources like users and listings to be linked to
  
end
