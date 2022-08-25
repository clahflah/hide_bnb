Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :listings do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:index, :show, :destroy, :update, :edit ]

  # Defines the root path route ("/")
  # root "articles#index"
end
