Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories, only: %i[index create destroy]
  resources :books, only: %i[index create destroy]
end
