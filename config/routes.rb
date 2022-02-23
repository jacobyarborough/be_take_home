Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      get '/subscriptions', to: 'subscriptions#index'
      post '/customer_subscriptions', to: 'customer_subscriptions#create'
      put '/customer_subscriptions', to: 'customer_subscriptions#update'
    end 
  end 
end
