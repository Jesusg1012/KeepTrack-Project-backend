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
      delete '/reminders', to: "reminders#destroy"
      get '/project', to: 'project#view'
      post '/list', to: 'list#new'
      get 'list', to: 'list#view'
      patch '/list/row', to: 'list#row'
      delete '/list/row', to: 'list#delete_row'
      patch 'list/column', to: 'list#column'
      delete '/list/column', to: 'list#delete_column'
      patch '/list/info', to: 'list#info'
      delete '/list', to: 'list#destroy'
      patch '/project', to: 'project#change'
      post '/project', to: 'project#new'
    end
  end
end
