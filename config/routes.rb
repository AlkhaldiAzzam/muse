Rails.application.routes.draw do
  root 'artist#index' #idont know what this does...yet
 resources :artists , :songs  #This will make the routes for you (EVERY. SINGLE. ROUTE you need), just put in the console : 'rails routes'
 

end
