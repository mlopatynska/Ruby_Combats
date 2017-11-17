Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  root to: 'static#index'
  get 'users/profile', to: 'users#profile'
  get '/location', to: 'location#index'
  post '/location', to: 'location#update'
  get 'location/page', to: 'location#page'
  post 'location/page', to: 'location#page'

  devise_for :users, :controllers => {sessions: 'sessions'}

  devise_scope :user do
    root to: 'devise/sessions#new'
    post '/users/signup', to: 'registrations#create'
    patch '/users/update_password' , to: 'users#update_password'
    put '/users/profile', to: 'registrations#update'
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/edit', to: 'devise/registrations#edit'
  end

  resources :users do
      member do
        get :confirm_email
      end
  end

  patch 'users', to: 'users#update'
  resources :users, only: %i[index destroy update]

  get 'users/fight'
  post 'users/:id/addexp', to: 'users#add_experience'

  put '/locale' => 'application#change_locale'

end
