Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :listings do
    resources :bookings, only: [:create, :new]
  end
  resources :users, only: [:index, :show] do
    resources :bookings, only: [:index, :show, :destroy]
  end


  # Defines the root path route ("/")
  # root "articles#index"
end
