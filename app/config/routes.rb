Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/fibonacci/:n', to: 'home#fibonacci'
  get '/nplus1/:n', to: 'home#nplus1'
  get '/pg_sleep/:ms/:times', to: 'home#pg_sleep'
end
