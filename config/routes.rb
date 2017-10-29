Rails.application.routes.draw do

  get '/persons/profile', to: 'persons#profile'
  post '/persons/profile', to: 'persons#profile'
  # post '/persons/profile', to: 'persons#new_message', as: :new_message

  post '/new_message' => 'persons#new_message', :as => :new_message

  devise_for :users, :controllers => {sessions: 'sessions'}
  
  devise_scope :user do
    root to: 'devise/sessions#new'

    post '/users/signup', to: 'registrations#create'
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/edit', to: 'devise/registrations#edit'
  end

  patch 'users', to: 'users#update'
  resources :users, only: %i[index destroy update]

  # post '/new_message' => 'chats#new_message', :as => :new_message


  # get 'users/fight'
  # post 'users/:id/addexp', to: 'users#add_experience'

  # get  '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'



#   get  '/login' => 'sessions#new', :as => :login
# post '/login' => 'sessions#create', :as => :login

end
