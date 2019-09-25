Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/signup', to: 'users#create'
      resources :projects, only: [:create, :index]
      resources :languages, only: [:index]
      post '/add_image', to: 'projects#add_img'
    end
  end

  
end
