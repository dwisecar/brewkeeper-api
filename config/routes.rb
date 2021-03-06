Rails.application.routes.draw do
  post '/signin', to: 'users#signin'
  namespace :api do
    namespace :v1 do
      patch '/edit', to: 'users#update'
      post '/signup', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/brewers', to: 'users#index'
      get '/brewers/:id', to: 'users#show'
      get '/persist', to: 'auth#show'
    end
  end
  

  resources :recipe_styles
  resources :recipe_yeasts
  resources :recipe_hops
  resources :recipe_fermentables
  resources :recipes
  resources :styles
  resources :yeasts
  resources :hops
  resources :fermentables
  resources :ratings
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
