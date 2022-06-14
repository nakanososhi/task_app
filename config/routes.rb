Rails.application.routes.draw do
  get 'users/index'
    get 'lessons/hello', to: 'lessons#hello'
    get 'lessons/call', to: 'lessons#call'

    resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
