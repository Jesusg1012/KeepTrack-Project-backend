Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      post '/login', to: 'auth#create'
      post '/new-reminder', to: 'users#reminder'
      get '/profile', to: 'users#profile'
      patch '/reminders', to: 'reminders#update'
      patch '/notifications', to: 'reminders#notification'
    end
  end
end
