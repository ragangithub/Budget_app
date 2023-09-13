Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :categories, only: %i[index new create destroy] do
    resources :payments, only: %i[index new create]
  end
end
