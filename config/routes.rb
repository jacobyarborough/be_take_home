Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      get '/subscriptions', to: 'subscriptions#index'
      post '/subscriptions', to: 'subscriptions#create'
      delete '/subscriptions', to: 'subscriptions#destroy'
    end 
  end 
end
