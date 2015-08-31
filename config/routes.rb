Rails.application.routes.draw do
  get '/' => 'pages#home'
  # Routes for the Signup resource:
  # CREATE
  get '/new_signup' => 'signups#new'
  get '/events/:id/create_signup' => 'signups#create'
  get '/events/:id/cancel_signup' => 'signups#cancel_signup'
  get '/events/:id/edit' => 'pages#edit_event'
  get '/events/:id/change' => 'pages#change_event'
  get '/events/:id/complete_event' => 'pages#complete_event'

  # READ
  get '/signups' => 'signups#index'
  get '/signups/:id' => 'signups#show'

  # UPDATE
  get '/signups/:id/edit' => 'signups#edit'
  get '/signups/:id/update' => 'signups#update'

  # DELETE
  get '/signups/:id/destroy' => 'signups#destroy'
  #------------------------------

  get '/about' => 'pages#about'
  get '/home' => 'pages#home'
  get '/officers' => 'pages#officers'
  get '/international_project_committee' => 'pages#ipc'
  get '/community_project_committee' => 'pages#cpc'
  get '/contact_us' => 'pages#contact' 
  get '/events' => 'pages#events'
  get '/events/new' => 'pages#new_event'
  get '/events/create' => 'pages#create_event'
  
  get '/sessions/new' => 'sessions#new'
  get '/sessions/create' => 'sessions#create'
  
  get '/sessions/destroy' => 'sessions#destroy'
  
  # Routes for the User resource:
  # CREATE
  get '/new_user' => 'users#new'
  get '/create_user' => 'users#create'

  # READ
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'

  # UPDATE
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/update' => 'users#update'

  # DELETE
  get '/users/:id/destroy' => 'users#destroy'
  #------------------------------

end
