Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/signup', to: 'users#create'
      resources :projects, only: [:create, :index, :destroy, :update]
      resources :languages, only: [:index]
      resources :tasks, only: [:destroy, :update]
      post '/add_image', to: 'projects#add_img'
      post '/add_task', to: 'projects#add_task'
    end
  end

  
end
