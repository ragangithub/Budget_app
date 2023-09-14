Rails.application.routes.draw do
  devise_for :users

  
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'splash#splash', as: :unauthenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: 'categories#index'

  resources :categories, only: %i[index new create destroy] do
    resources :payments, only: %i[index new create]
  end
end
